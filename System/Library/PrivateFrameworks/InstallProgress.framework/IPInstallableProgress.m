@implementation IPInstallableProgress

- (IPInstallableProgress)initWithSource:(id)a3 progressSnapshot:(id)a4
{
  id v7;
  id v8;
  IPInstallableProgress *v9;
  IPInstallableProgress *v10;
  uint64_t v11;
  IPInstallableProgressData *data;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IPInstallableProgress;
  v9 = -[IPInstallableProgress init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    v11 = objc_msgSend(v8, "copy");
    data = v10->_data;
    v10->_data = (IPInstallableProgressData *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:progressSnapshot:", self->_source, self->_data);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p { %@ }>"), objc_opt_class(), self, self->_data);
}

- (double)overallFractionCompleted
{
  double result;

  -[IPInstallableProgressData fractionCompleted](self->_data, "fractionCompleted");
  return result;
}

- (unint64_t)phase
{
  return -[IPInstallableProgressData installPhase](self->_data, "installPhase");
}

- (unint64_t)phaseTotalUnitCount
{
  return -[IPInstallableProgressData totalUnitCountForPhase:](self->_data, "totalUnitCountForPhase:", -[IPInstallableProgressData installPhase](self->_data, "installPhase"));
}

- (unint64_t)phaseCompletedUnitCount
{
  return -[IPInstallableProgressData completedUnitCountForPhase:](self->_data, "completedUnitCountForPhase:", -[IPInstallableProgressData installPhase](self->_data, "installPhase"));
}

- (double)phaseFractionCompleted
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[IPInstallableProgressData totalUnitCountForPhase:](self->_data, "totalUnitCountForPhase:", -[IPInstallableProgressData installPhase](self->_data, "installPhase"));
  v4 = -[IPInstallableProgressData completedUnitCountForPhase:](self->_data, "completedUnitCountForPhase:", -[IPInstallableProgressData installPhase](self->_data, "installPhase"));
  if (v3)
    return (double)v4 / (double)v3;
  else
    return 1.0;
}

- (IPInstallableProgressSource)source
{
  return (IPInstallableProgressSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
