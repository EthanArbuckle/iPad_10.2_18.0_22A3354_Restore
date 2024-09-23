@implementation NUExportRequest

- (NUExportRequest)initWithComposition:(id)a3
{
  NUExportRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUExportRequest;
  v3 = -[NURenderRequest initWithComposition:](&v7, sel_initWithComposition_, a3);
  +[NUFixedScalePolicy oneToOneScalePolicy](NUFixedScalePolicy, "oneToOneScalePolicy");
  v4 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

- (NUExportRequest)initWithComposition:(id)a3 destinationURL:(id)a4
{
  id v6;
  NUExportRequest *v7;
  uint64_t v8;
  NSURL *destinationURL;

  v6 = a4;
  v7 = -[NUExportRequest initWithComposition:](self, "initWithComposition:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    destinationURL = v7->_destinationURL;
    v7->_destinationURL = (NSURL *)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUExportRequest;
  v4 = -[NURenderRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSURL copy](self->_destinationURL, "copy");
    v6 = (void *)*((_QWORD *)v4 + 19);
    *((_QWORD *)v4 + 19) = v5;

    objc_storeStrong((id *)v4 + 20, self->_scalePolicy);
  }
  return v4;
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end
