@implementation SCSensitivityAnalysis

+ (id)resultsWithSensitive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSensitive:", v3);
  return v4;
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

@end
