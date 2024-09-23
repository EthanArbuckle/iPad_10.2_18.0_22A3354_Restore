@implementation MADVideoRemoveBackgroundResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundResult)initWithUniformTypeIdentifier:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 data:(id)a6
{
  id v11;
  id v12;
  MADVideoRemoveBackgroundResult *v13;
  MADVideoRemoveBackgroundResult *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MADVideoRemoveBackgroundResult;
  v13 = -[MADVideoRemoveBackgroundResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uniformTypeIdentifier, a3);
    v14->_width = a4;
    v14->_height = a5;
    objc_storeStrong((id *)&v14->_data, a6);
  }

  return v14;
}

- (MADVideoRemoveBackgroundResult)initWithCoder:(id)a3
{
  id v4;
  MADVideoRemoveBackgroundResult *v5;
  uint64_t v6;
  UTType *uniformTypeIdentifier;
  uint64_t v8;
  NSData *data;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADVideoRemoveBackgroundResult;
  v5 = -[MADVideoResult initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniformTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (UTType *)v6;

    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Width"));
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Height"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundResult;
  v4 = a3;
  -[MADVideoResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniformTypeIdentifier, CFSTR("UniformTypeIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_width, CFSTR("Width"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_height, CFSTR("Height"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("Data"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("uniformTypeIdentifier: %@, "), self->_uniformTypeIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("width: %u, "), self->_width);
  objc_msgSend(v3, "appendFormat:", CFSTR("height: %u, "), self->_height);
  objc_msgSend(v3, "appendFormat:", CFSTR("data: %@>"), self->_data);
  return v3;
}

- (UTType)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

@end
