@implementation DACChangeMarker

- (DACChangeMarker)init
{
  DACChangeMarker *v2;
  DACChangeMarker *v3;
  uint64_t v4;
  NSUUID *uuid;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DACChangeMarker;
  v2 = -[DACChangeMarker init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v4;

  }
  return v3;
}

+ (id)missingMarker
{
  NSObject *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (qword_2557FD558 != -1)
    dispatch_once(&qword_2557FD558, &__block_literal_global_0);
  DACLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = _MergedGlobals;
    _os_log_error_impl(&dword_224FBF000, v2, OS_LOG_TYPE_ERROR, "Change Marker missing, using %{public}@", (uint8_t *)&v4, 0xCu);
  }

  return (id)_MergedGlobals;
}

void __32__DACChangeMarker_missingMarker__block_invoke()
{
  DACChangeMarker *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(DACChangeMarker);
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &UUID_NULL);
  v3 = *(void **)(_MergedGlobals + 16);
  *(_QWORD *)(_MergedGlobals + 16) = v2;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DACChangeMarker version](self, "version");
  -[DACChangeMarker uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, v(%ld) u(%@)>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (DACChangeMarker)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  NSUUID *v8;
  DACChangeMarker *v9;
  NSObject *p_super;
  objc_super v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  if (v5 < 1)
  {
    DACLogForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_224FBF000, p_super, OS_LOG_TYPE_ERROR, "Failed to decode change marker, invalid version", buf, 2u);
    }
    v8 = (NSUUID *)self;
    self = 0;
    goto LABEL_11;
  }
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    DACLogForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v6;
      _os_log_error_impl(&dword_224FBF000, p_super, OS_LOG_TYPE_ERROR, "Failed to decode change marker v(%ld), no UUID", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = (NSUUID *)v7;
  v12.receiver = self;
  v12.super_class = (Class)DACChangeMarker;
  v9 = -[DACChangeMarker init](&v12, sel_init);
  self = v9;
  if (v9)
  {
    v9->_version = v6;
    v8 = v8;
    p_super = &self->_uuid->super;
    self->_uuid = v8;
LABEL_11:

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DACChangeMarker version](self, "version"), CFSTR("version"));
  -[DACChangeMarker uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isEqualToChangeMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DACChangeMarker uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  DACChangeMarker *v4;
  DACChangeMarker *v5;
  BOOL v6;

  v4 = (DACChangeMarker *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[DACChangeMarker _isEqualToChangeMarker:](self, "_isEqualToChangeMarker:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DACChangeMarker uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)version
{
  return self->_version;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
