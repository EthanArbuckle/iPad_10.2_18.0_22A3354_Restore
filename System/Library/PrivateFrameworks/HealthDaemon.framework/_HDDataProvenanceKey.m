@implementation _HDDataProvenanceKey

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDDataOriginProvenance *dataProvenance;
  HDDataOriginProvenance *v6;
  NSString *localProductType;
  NSString *v8;
  NSString *localSystemBuild;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  dataProvenance = self->_dataProvenance;
  v6 = (HDDataOriginProvenance *)v4[2];
  if (dataProvenance != v6 && (!v6 || !-[HDDataOriginProvenance isEqual:](dataProvenance, "isEqual:")))
    goto LABEL_11;
  localProductType = self->_localProductType;
  v8 = (NSString *)v4[3];
  if (localProductType != v8 && (!v8 || !-[NSString isEqualToString:](localProductType, "isEqualToString:")))
    goto LABEL_11;
  localSystemBuild = self->_localSystemBuild;
  v10 = (NSString *)v4[4];
  if (localSystemBuild == v10)
  {
    v11 = 1;
    goto LABEL_12;
  }
  if (v10)
    v11 = -[NSString isEqualToString:](localSystemBuild, "isEqualToString:");
  else
LABEL_11:
    v11 = 0;
LABEL_12:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSystemBuild, 0);
  objc_storeStrong((id *)&self->_localProductType, 0);
  objc_storeStrong((id *)&self->_dataProvenance, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ localBuild=%@, localProductType=%@>"), objc_opt_class(), self, self->_dataProvenance, self->_localSystemBuild, self->_localProductType);
}

@end
