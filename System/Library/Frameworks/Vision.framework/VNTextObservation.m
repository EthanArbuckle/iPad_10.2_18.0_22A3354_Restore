@implementation VNTextObservation

- (VNTextObservation)initWithCoder:(id)a3
{
  id v4;
  VNTextObservation *v5;
  void *v6;
  uint64_t v7;
  NSString *text;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *characterBoxes;
  VNTextObservation *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNTextObservation;
  v5 = -[VNRectangleObservation initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("characterBoxes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    characterBoxes = v5->_characterBoxes;
    v5->_characterBoxes = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNTextObservation;
  -[VNRectangleObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_characterBoxes, CFSTR("characterBoxes"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNTextObservation;
  -[VNRectangleObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSArray copy](self->_characterBoxes, "copy");
    v5 = (void *)v3[28];
    v3[28] = v4;

  }
  return v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNTextObservation;
  v3 = -[VNRectangleObservation hash](&v7, sel_hash);
  -[VNTextObservation characterBoxes](self, "characterBoxes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNTextObservation *v4;
  VNTextObservation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNTextObservation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNTextObservation;
    if (-[VNRectangleObservation isEqual:](&v10, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNTextObservation characterBoxes](self, "characterBoxes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNTextObservation characterBoxes](v5, "characterBoxes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSArray)characterBoxes
{
  return self->_characterBoxes;
}

- (void)setCharacterBoxes:(id)a3
{
  NSArray *v4;
  NSArray *characterBoxes;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  characterBoxes = self->_characterBoxes;
  self->_characterBoxes = v4;

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  text = self->_text;
  self->_text = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_characterBoxes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
