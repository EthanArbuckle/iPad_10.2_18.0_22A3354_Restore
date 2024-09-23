@implementation ATSpatialStreamParameters

- (ATSpatialStreamParameters)init
{
  -[ATSpatialStreamParameters doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)initInternalWithFormat:(id)a3
{
  id v5;
  ATSpatialStreamParameters *v6;
  id *p_isa;
  NSUUID *identifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATSpatialStreamParameters;
  v6 = -[ATSpatialStreamParameters init](&v10, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    identifier = v6->_identifier;
    v6->_identifier = 0;

    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

- (BOOL)enableStreamWithIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  NSUUID *v8;
  id *p_identifier;
  NSUUID *identifier;
  id v11;

  v7 = a3;
  identifier = self->_identifier;
  p_identifier = (id *)&self->_identifier;
  v8 = identifier;
  if (!identifier)
    goto LABEL_4;
  if ((-[NSUUID isEqual:](v8, "isEqual:", v7) & 1) != 0)
  {
    if (*p_identifier)
    {
LABEL_5:
      if (a4)
        *a4 = 0;
      LOBYTE(a4) = 1;
      goto LABEL_10;
    }
LABEL_4:
    objc_storeStrong(p_identifier, a3);
    goto LABEL_5;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v11;

    LOBYTE(a4) = 0;
  }
LABEL_10:

  return (char)a4;
}

- (void)disableStream
{
  NSUUID *identifier;

  identifier = self->_identifier;
  self->_identifier = 0;

}

- (BOOL)isEqual:(id)a3
{
  ATSpatialStreamParameters *v4;
  ATSpatialStreamParameters *v5;
  _BOOL4 v6;
  void *v7;
  NSUUID *identifier;
  void *v9;
  AVAudioFormat *format;
  void *v11;
  char v12;
  BOOL result;

  v4 = (ATSpatialStreamParameters *)a3;
  if (v4 == self)
  {
    v12 = 1;
LABEL_12:

    return v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = -[ATSpatialStreamParameters isEnabled](self, "isEnabled");
  if (v6 != -[ATSpatialStreamParameters isEnabled](v5, "isEnabled"))
    goto LABEL_10;
  if (self->_identifier)
  {
    -[ATSpatialStreamParameters identifier](v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      identifier = self->_identifier;
      -[ATSpatialStreamParameters identifier](v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(identifier) = -[NSUUID isEqual:](identifier, "isEqual:", v9);

      if ((identifier & 1) != 0)
      {
        format = self->_format;
        -[ATSpatialStreamParameters format](v5, "format");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[AVAudioFormat isEqual:](format, "isEqual:", v11);

LABEL_11:
        goto LABEL_12;
      }
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
  }
  _os_assert_log();
  result = _os_crash();
  __break(1u);
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  return -[AVAudioFormat hash](self->_format, "hash") - v3 + 32 * v3 + 961;
}

- (BOOL)isEnabled
{
  return self->_identifier != 0;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  -[AVAudioFormat description](self->_format, "description");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<params@%p: id %s, format %s>"), self, v5, objc_msgSend(v6, "UTF8String"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
