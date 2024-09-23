@implementation _GEOInternalResourceManifestUpdateAssertionRecord

- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5
{
  return -[_GEOInternalResourceManifestUpdateAssertionRecord initWithReason:](self, "initWithReason:", a4, a5);
}

- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithReason:(id)a3
{
  id v4;
  CFAbsoluteTime Current;
  _GEOInternalResourceManifestUpdateAssertionRecord *v6;
  objc_super v8;

  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v8.receiver = self;
  v8.super_class = (Class)_GEOInternalResourceManifestUpdateAssertionRecord;
  v6 = -[_GEOResourceManifestUpdateAssertionRecord initWithProcess:reason:creationTimestamp:](&v8, sel_initWithProcess_reason_creationTimestamp_, CFSTR("geod"), v4, Current);

  return v6;
}

- (BOOL)isExpired
{
  return 0;
}

- (id)description
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GEOInternalResourceManifestUpdateAssertionRecord;
  -[_GEOResourceManifestUpdateAssertionRecord description](&v5, sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" (internal)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
