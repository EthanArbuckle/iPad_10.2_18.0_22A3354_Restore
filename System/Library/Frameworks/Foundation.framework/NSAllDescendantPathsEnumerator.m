@implementation NSAllDescendantPathsEnumerator

- (void)skipDescendants
{
  NSAllDescendantPathsEnumerator *under;
  uint64_t v4;

  under = self->under;
  if (under && (v4 = -[NSAllDescendantPathsEnumerator _under](under, "_under"), under = self->under, !v4))
  {

    self->under = 0;
  }
  else
  {
    -[NSAllDescendantPathsEnumerator skipDescendents](under, "skipDescendents");
  }
}

- (id)_under
{
  return self->under;
}

- (id)nextObject
{
  NSAllDescendantPathsEnumerator *under;
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSString *v7;
  NSString *prepend;
  uint64_t v10;
  NSString *v11;
  stat v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(&v12, 0, sizeof(v12));
  under = self->under;
  if (under)
  {
    v4 = -[NSAllDescendantPathsEnumerator nextObject](under, "nextObject", *(_OWORD *)&v12.st_dev, *(_OWORD *)&v12.st_uid, *(_OWORD *)&v12.st_atimespec, *(_OWORD *)&v12.st_mtimespec, *(_OWORD *)&v12.st_ctimespec, *(_OWORD *)&v12.st_birthtimespec, *(_OWORD *)&v12.st_size, *(_OWORD *)&v12.st_blksize, *(_OWORD *)v12.st_qspare);
    if (v4)
      return v4;

    self->pathToLastReportedItem = self->under->pathToLastReportedItem;
    self->under = 0;
  }
  v5 = -[NSArray count](self->contents, "count", *(_QWORD *)&v12.st_dev);
  if (self->idx >= v5)
    return 0;
  v6 = v5;
  while (1)
  {
    v4 = -[NSArray objectAtIndex:](self->contents, "objectAtIndex:");
    ++self->idx;
    v7 = -[NSString stringByAppendingString:](self->path, "stringByAppendingString:", v4);
    if (!lstat(-[NSString fileSystemRepresentation](v7, "fileSystemRepresentation"), &v12))
      break;
    if (self->idx >= v6)
      return 0;
  }

  self->pathToLastReportedItem = v7;
  if ((v12.st_mode & 0xF000) == 0x4000)
  {
    prepend = self->prepend;
    v10 = (uint64_t)v4;
    if (prepend)
      v10 = -[NSString stringByAppendingPathComponent:](prepend, "stringByAppendingPathComponent:", v4, v4);
    self->under = (NSAllDescendantPathsEnumerator *)+[NSAllDescendantPathsEnumerator newWithPath:prepend:attributes:cross:depth:](NSAllDescendantPathsEnumerator, "newWithPath:prepend:attributes:cross:depth:", v7, v10, 0, self->cross, self->depth + 1);
  }
  v11 = self->prepend;
  if (v11)
    return -[NSString stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", v4);
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAllDescendantPathsEnumerator;
  -[NSAllDescendantPathsEnumerator dealloc](&v3, sel_dealloc);
}

+ (id)newWithPath:(id)a3 prepend:(id)a4 attributes:(id)a5 cross:(BOOL)a6 depth:(unint64_t)a7
{
  uint64_t v12;

  v12 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  *(_QWORD *)(v12 + 16) = -[NSFileManager contentsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  *(_QWORD *)(v12 + 32) = objc_msgSend(a4, "copyWithZone:", 0);
  *(_QWORD *)(v12 + 8) = (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("/"));
  *(_QWORD *)(v12 + 48) = a5;
  *(_BYTE *)(v12 + 72) = a6;
  *(_QWORD *)(v12 + 64) = a7;
  return (id)v12;
}

- (id)fileAttributes
{
  NSAllDescendantPathsEnumerator *v2;

  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  return -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v2->pathToLastReportedItem, 0);
}

- (id)directoryAttributes
{
  return -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", self->path, 0);
}

- (id)currentSubdirectoryAttributes
{
  NSAllDescendantPathsEnumerator *v2;

  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  return -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", -[NSString stringByDeletingLastPathComponent](v2->pathToLastReportedItem, "stringByDeletingLastPathComponent"), 0);
}

- (unint64_t)level
{
  NSAllDescendantPathsEnumerator *v2;

  do
  {
    v2 = self;
    self = self->under;
  }
  while (self && self->idx);
  return v2->depth;
}

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return 0;
}

@end
