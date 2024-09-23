@implementation NTKCFaceDetailShowSecondsCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailShowSecondsCell)initWithCollection:(id)a3
{
  id v5;
  NTKCFaceDetailShowSecondsCell *v6;
  NTKCFaceDetailShowSecondsCell *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailShowSecondsCell;
  v6 = -[NTKCFaceDetailToggleCell init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    -[NTKEditOptionCollection localizedName](v7->_collection, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailShowSecondsCell textLabel](v7, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
  return v7;
}

- (NTKEditOptionCollection)collection
{
  return self->_collection;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
