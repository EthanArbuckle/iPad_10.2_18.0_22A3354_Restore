@implementation _GEOResourceManifestUpdateAssertionRecord

- (_GEOResourceManifestUpdateAssertionRecord)init
{
  _GEOResourceManifestUpdateAssertionRecord *result;

  result = (_GEOResourceManifestUpdateAssertionRecord *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)Current
{
  id v8;
  id v9;
  _GEOResourceManifestUpdateAssertionRecord *v10;
  uint64_t v11;
  NSString *process;
  uint64_t v13;
  NSString *reason;
  _GEOResourceManifestUpdateAssertionRecord *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOResourceManifestUpdateAssertionRecord;
  v10 = -[_GEOResourceManifestUpdateAssertionRecord init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    process = v10->_process;
    v10->_process = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;

    if (CFAbsoluteTimeGetCurrent() <= Current)
      Current = CFAbsoluteTimeGetCurrent();
    v10->_creationTimestamp = Current;
    v15 = v10;
  }

  return v10;
}

- (BOOL)isExpired
{
  double creationTimestamp;
  double v4;

  creationTimestamp = self->_creationTimestamp;
  if (creationTimestamp >= CFAbsoluteTimeGetCurrent())
    return 1;
  v4 = CFAbsoluteTimeGetCurrent() - self->_creationTimestamp;
  return v4 >= GEOConfigGetDouble(GeoServicesConfig_ResourceManifestUpdateAssertionTimeout, (uint64_t)off_1EDF4DD38);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@>"), self->_process, self->_reason);
}

- (NSString)process
{
  return self->_process;
}

- (NSString)reason
{
  return self->_reason;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
