@implementation TabSnapshotRequest

- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5
{
  return -[TabSnapshotRequest initWithSize:topBackdropHeight:options:identifier:](self, "initWithSize:topBackdropHeight:options:identifier:", a5, 0, a3.width, a3.height, a4);
}

- (TabSnapshotRequest)initWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 identifier:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  TabSnapshotRequest *v12;
  TabSnapshotRequest *v13;
  uint64_t v14;
  NSObject *identifier;
  TabSnapshotRequest *v16;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TabSnapshotRequest;
  v12 = -[TabSnapshotRequest init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_size.width = width;
    v12->_size.height = height;
    v12->_topBackdropHeight = a4;
    v12->_options = a5;
    v14 = objc_msgSend(v11, "copyWithZone:", 0);
    identifier = v13->_identifier;
    v13->_identifier = v14;

    v16 = v13;
  }

  return v13;
}

- (unint64_t)hash
{
  return -[NSObject hash](self->_identifier, "hash") ^ (uint64_t)self->_size.width ^ (16 * (uint64_t)self->_size.height) ^ ((uint64_t)self->_topBackdropHeight << 8) ^ (self->_options << 12);
}

- (BOOL)isEqual:(id)a3
{
  TabSnapshotRequest *v4;
  TabSnapshotRequest *v5;
  NSObject *identifier;
  void *v7;
  double v8;
  BOOL v9;
  double v10;
  unint64_t options;
  double topBackdropHeight;
  double v13;

  v4 = (TabSnapshotRequest *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      -[TabSnapshotRequest identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSObject isEqual:](identifier, "isEqual:", v7))
        goto LABEL_10;
      -[TabSnapshotRequest size](v5, "size");
      v9 = 0;
      if (self->_size.width != v10 || self->_size.height != v8)
        goto LABEL_11;
      options = self->_options;
      if (options == -[TabSnapshotRequest options](v5, "options"))
      {
        topBackdropHeight = self->_topBackdropHeight;
        -[TabSnapshotRequest topBackdropHeight](v5, "topBackdropHeight");
        v9 = topBackdropHeight == v13;
      }
      else
      {
LABEL_10:
        v9 = 0;
      }
LABEL_11:

      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
