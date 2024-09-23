@implementation NTKFaceSnapshotCacheRequestOptions

- (id)ntk_asDictionaryOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[NTKFaceSnapshotter defaultModernSnapshotOptions](NTKFaceSnapshotter, "defaultModernSnapshotOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKFaceSnapshotCacheRequestOptions priority](self, "priority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("NTKSnapshotPriorityKey"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (NTKFaceSnapshotCacheRequestOptions)initWithPriority:(unint64_t)a3
{
  NTKFaceSnapshotCacheRequestOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKFaceSnapshotCacheRequestOptions;
  result = -[NTKFaceSnapshotCacheRequestOptions init](&v5, sel_init);
  if (result)
    result->_priority = a3;
  return result;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end
