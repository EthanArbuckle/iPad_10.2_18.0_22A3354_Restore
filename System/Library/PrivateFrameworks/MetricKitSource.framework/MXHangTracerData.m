@implementation MXHangTracerData

- (id)initPayloadDataWithDiagnostics:(id)a3
{
  id v4;
  MXHangTracerData *v5;
  uint64_t v6;
  MXHangDiagnostic *hangDiagnostic;
  uint64_t v8;
  MXAppLaunchDiagnostic *appLaunchDiagnostic;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXHangTracerData;
  v5 = -[MXSourceData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hangDiagnostic"));
    v6 = objc_claimAutoreleasedReturnValue();
    hangDiagnostic = v5->_hangDiagnostic;
    v5->_hangDiagnostic = (MXHangDiagnostic *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appLaunchDiagnostic"));
    v8 = objc_claimAutoreleasedReturnValue();
    appLaunchDiagnostic = v5->_appLaunchDiagnostic;
    v5->_appLaunchDiagnostic = (MXAppLaunchDiagnostic *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXHangDiagnostic *hangDiagnostic;
  id v5;

  hangDiagnostic = self->_hangDiagnostic;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hangDiagnostic, CFSTR("hangDiagnostic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appLaunchDiagnostic, CFSTR("appLaunchDiagnostic"));

}

- (MXHangTracerData)initWithCoder:(id)a3
{
  id v4;
  MXHangTracerData *v5;
  uint64_t v6;
  MXHangDiagnostic *hangDiagnostic;
  uint64_t v8;
  MXAppLaunchDiagnostic *appLaunchDiagnostic;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXHangTracerData;
  v5 = -[MXSourceData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hangDiagnostic"));
    v6 = objc_claimAutoreleasedReturnValue();
    hangDiagnostic = v5->_hangDiagnostic;
    v5->_hangDiagnostic = (MXHangDiagnostic *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchDiagnostic"));
    v8 = objc_claimAutoreleasedReturnValue();
    appLaunchDiagnostic = v5->_appLaunchDiagnostic;
    v5->_appLaunchDiagnostic = (MXAppLaunchDiagnostic *)v8;

  }
  return v5;
}

- (MXHangDiagnostic)hangDiagnostic
{
  return (MXHangDiagnostic *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHangDiagnostic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MXAppLaunchDiagnostic)appLaunchDiagnostic
{
  return (MXAppLaunchDiagnostic *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppLaunchDiagnostic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchDiagnostic, 0);
  objc_storeStrong((id *)&self->_hangDiagnostic, 0);
}

@end
