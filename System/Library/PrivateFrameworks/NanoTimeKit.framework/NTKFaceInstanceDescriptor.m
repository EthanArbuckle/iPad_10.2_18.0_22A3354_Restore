@implementation NTKFaceInstanceDescriptor

- (NTKFaceInstanceDescriptor)initWithJSONRepresentation:(id)a3 nrDeviceUUID:(id)a4 resourceDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKFaceInstanceDescriptor *v11;
  uint64_t v12;
  NSData *faceJSONRepresentation;
  uint64_t v14;
  NSString *resourceDirectory;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceInstanceDescriptor;
  v11 = -[NTKFaceInstanceDescriptor init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    faceJSONRepresentation = v11->_faceJSONRepresentation;
    v11->_faceJSONRepresentation = (NSData *)v12;

    objc_storeStrong((id *)&v11->_nrDeviceUUID, a4);
    v14 = objc_msgSend(v10, "copy");
    resourceDirectory = v11->_resourceDirectory;
    v11->_resourceDirectory = (NSString *)v14;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[NTKFaceInstanceDescriptor faceJSONRepresentation](self, "faceJSONRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NTKFaceInstanceDescriptor resourceDirectory](self, "resourceDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[NTKFaceInstanceDescriptor nrDeviceUUID](self, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (16 * objc_msgSend(v7, "hash"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "nrDeviceUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceInstanceDescriptor nrDeviceUUID](self, "nrDeviceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (NTKEqualObjects(v7, v6))
    {
      objc_msgSend(v5, "faceJSONRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceInstanceDescriptor faceJSONRepresentation](self, "faceJSONRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (NTKEqualObjects(v9, v8))
      {
        objc_msgSend(v5, "resourceDirectory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFaceInstanceDescriptor resourceDirectory](self, "resourceDirectory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = NTKEqualObjects(v11, v10);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTKFaceInstanceDescriptor faceJSONRepresentation](self, "faceJSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("faceJSONRepresentation"));

  -[NTKFaceInstanceDescriptor resourceDirectory](self, "resourceDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("resourceDirectory"));

  -[NTKFaceInstanceDescriptor nrDeviceUUID](self, "nrDeviceUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("nrDeviceUUID"));

}

- (NTKFaceInstanceDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NTKFaceInstanceDescriptor *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceJSONRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nrDeviceUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NTKFaceInstanceDescriptor initWithJSONRepresentation:nrDeviceUUID:resourceDirectory:](self, "initWithJSONRepresentation:nrDeviceUUID:resourceDirectory:", v5, v6, v7);
  return v8;
}

- (NSData)faceJSONRepresentation
{
  return self->_faceJSONRepresentation;
}

- (NSUUID)nrDeviceUUID
{
  return self->_nrDeviceUUID;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_nrDeviceUUID, 0);
  objc_storeStrong((id *)&self->_faceJSONRepresentation, 0);
}

@end
