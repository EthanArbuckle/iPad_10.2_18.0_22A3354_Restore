@implementation NTKCFaceDetailMonogramComplicationCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailMonogramComplicationCell)initWithSlot:(id)a3 inFace:(id)a4
{
  id v6;
  id v7;
  NTKCFaceDetailMonogramComplicationCell *v8;
  uint64_t v9;
  NSString *slot;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKCFaceDetailMonogramComplicationCell;
  v8 = -[NTKCFaceDetailToggleCell init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    slot = v8->_slot;
    v8->_slot = (NSString *)v9;

    objc_msgSend(v7, "displayNameForComplicationSlot:", v8->_slot);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailMonogramComplicationCell textLabel](v8, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  return v8;
}

- (NSString)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);
}

@end
