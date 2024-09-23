@implementation MOEventBundleLabelFormat

- (MOEventBundleLabelFormat)initWithFormat:(id)a3 capitalizationType:(unint64_t)a4
{
  id v8;
  MOEventBundleLabelFormat *v9;
  MOEventBundleLabelFormat *v10;
  MOEventBundleLabelFormat *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)MOEventBundleLabelFormat;
    v9 = -[MOEventBundleLabelFormat init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_format, a3);
      v10->_capitalizationType = a4;
    }
    self = v10;
    v11 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormat initWithFormat:capitalizationType:].cold.1(v12);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelFormat.m"), 16, CFSTR("Invalid parameter not satisfying: format"));

    v11 = 0;
  }

  return v11;
}

- (MOEventBundleLabelFormat)initWithFormat:(id)a3
{
  return -[MOEventBundleLabelFormat initWithFormat:capitalizationType:](self, "initWithFormat:capitalizationType:", a3, 1);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOEventBundleLabelFormat format](self, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("labels, %@, capitalization type, %lu"), v4, -[MOEventBundleLabelFormat capitalizationType](self, "capitalizationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)capitalizationType
{
  return self->_capitalizationType;
}

- (void)setCapitalizationType:(unint64_t)a3
{
  self->_capitalizationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

- (void)initWithFormat:(os_log_t)log capitalizationType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: format", v1, 2u);
}

@end
