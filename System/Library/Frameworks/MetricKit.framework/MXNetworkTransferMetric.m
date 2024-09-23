@implementation MXNetworkTransferMetric

- (MXNetworkTransferMetric)initWithCumulativeWifiUploadMeasurement:(id)a3 cumulativeWifiDownloadMeasurement:(id)a4 cumulativeCellularUploadMeasurement:(id)a5 cumulativeCellularDownloadMeasurement:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MXNetworkTransferMetric *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  MXNetworkTransferMetric *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MXNetworkTransferMetric;
  v15 = -[MXMetric init](&v22, sel_init);
  if (!v15)
    goto LABEL_8;
  objc_msgSend(v11, "doubleValue");
  if (v16 >= 0.0)
  {
    objc_msgSend(v12, "doubleValue");
    if (v17 >= 0.0)
    {
      objc_msgSend(v13, "doubleValue");
      if (v18 >= 0.0)
      {
        objc_msgSend(v14, "doubleValue");
        if (v19 >= 0.0)
        {
          objc_storeStrong((id *)&v15->_cumulativeWifiUpload, a3);
          objc_storeStrong((id *)&v15->_cumulativeWifiDownload, a4);
          objc_storeStrong((id *)&v15->_cumulativeCellularUpload, a5);
          objc_storeStrong((id *)&v15->_cumulativeCellularDownload, a6);
LABEL_8:
          v20 = v15;
          goto LABEL_9;
        }
      }
    }
  }
  v20 = 0;
LABEL_9:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *cumulativeWifiUpload;
  id v5;

  cumulativeWifiUpload = self->_cumulativeWifiUpload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cumulativeWifiUpload, CFSTR("cumulativeWifiUpload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeWifiDownload, CFSTR("cumulativeWifiDownload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeCellularUpload, CFSTR("cumulativeCellularUpload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cumulativeCellularDownload, CFSTR("cumulativeCellularDownload"));

}

- (MXNetworkTransferMetric)initWithCoder:(id)a3
{
  id v4;
  MXNetworkTransferMetric *v5;
  uint64_t v6;
  NSMeasurement *cumulativeWifiUpload;
  uint64_t v8;
  NSMeasurement *cumulativeWifiDownload;
  uint64_t v10;
  NSMeasurement *cumulativeCellularUpload;
  uint64_t v12;
  NSMeasurement *cumulativeCellularDownload;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXNetworkTransferMetric;
  v5 = -[MXMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeWifiUpload"));
    v6 = objc_claimAutoreleasedReturnValue();
    cumulativeWifiUpload = v5->_cumulativeWifiUpload;
    v5->_cumulativeWifiUpload = (NSMeasurement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeWifiDownload"));
    v8 = objc_claimAutoreleasedReturnValue();
    cumulativeWifiDownload = v5->_cumulativeWifiDownload;
    v5->_cumulativeWifiDownload = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeCellularUpload"));
    v10 = objc_claimAutoreleasedReturnValue();
    cumulativeCellularUpload = v5->_cumulativeCellularUpload;
    v5->_cumulativeCellularUpload = (NSMeasurement *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cumulativeCellularDownload"));
    v12 = objc_claimAutoreleasedReturnValue();
    cumulativeCellularDownload = v5->_cumulativeCellularDownload;
    v5->_cumulativeCellularDownload = (NSMeasurement *)v12;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_cumulativeWifiUpload)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_cumulativeWifiUpload);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cumulativeWifiUpload"));

  }
  if (self->_cumulativeWifiDownload)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromMeasurement:", self->_cumulativeWifiDownload);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cumulativeWifiDownload"));

  }
  if (self->_cumulativeCellularUpload)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromMeasurement:", self->_cumulativeCellularUpload);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cumulativeCellularUpload"));

  }
  if (self->_cumulativeCellularDownload)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromMeasurement:", self->_cumulativeCellularDownload);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cumulativeCellularDownload"));

  }
  return v3;
}

- (NSMeasurement)cumulativeWifiUpload
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (NSMeasurement)cumulativeWifiDownload
{
  return (NSMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (NSMeasurement)cumulativeCellularUpload
{
  return (NSMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (NSMeasurement)cumulativeCellularDownload
{
  return (NSMeasurement *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cumulativeCellularDownload, 0);
  objc_storeStrong((id *)&self->_cumulativeCellularUpload, 0);
  objc_storeStrong((id *)&self->_cumulativeWifiDownload, 0);
  objc_storeStrong((id *)&self->_cumulativeWifiUpload, 0);
}

@end
