@implementation FIAPHistoricalDataRequest

- (FIAPHistoricalDataRequest)initWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return -[FIAPHistoricalDataRequest initWithRequestId:pluginIdentifier:personHandle:startDate:endDate:](self, "initWithRequestId:pluginIdentifier:personHandle:startDate:endDate:", 0, 0, a3, a4, a5);
}

- (FIAPHistoricalDataRequest)initWithRequestId:(unint64_t)a3 pluginIdentifier:(id)a4 personHandle:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FIAPHistoricalDataRequest *v17;
  FIAPHistoricalDataRequest *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FIAPHistoricalDataRequest;
  v17 = -[FIAPHistoricalDataRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_requestId = a3;
    objc_storeStrong((id *)&v17->_pluginIdentifier, a4);
    objc_storeStrong((id *)&v18->_personHandle, a5);
    objc_storeStrong((id *)&v18->_startDate, a6);
    objc_storeStrong((id *)&v18->_endDate, a7);
  }

  return v18;
}

- (void)setPluginIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pluginIdentifier, a3);
}

- (void)setRequestId:(unint64_t)a3
{
  self->_requestId = a3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<FIAPHistoricalDataRequest id:%llu p:%@ s:%@ e:%@ plugin:%@>"), self->_requestId, self->_personHandle, self->_startDate, self->_endDate, self->_pluginIdentifier);
}

- (unint64_t)hash
{
  unint64_t requestId;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  requestId = self->_requestId;
  v4 = -[NSString hash](self->_pluginIdentifier, "hash") - requestId + 32 * requestId;
  v5 = -[NSString hash](self->_personHandle, "hash") - v4 + 32 * v4;
  v6 = -[NSDate hash](self->_startDate, "hash") - v5 + 32 * v5;
  return -[NSDate hash](self->_endDate, "hash") - v6 + 32 * v6;
}

- (FIAPHistoricalDataRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FIAPHistoricalDataRequest *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rid"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FIAPHistoricalDataRequest initWithRequestId:pluginIdentifier:personHandle:startDate:endDate:](self, "initWithRequestId:pluginIdentifier:personHandle:startDate:endDate:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requestId;
  id v5;

  requestId = self->_requestId;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", requestId, CFSTR("rid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pluginIdentifier, CFSTR("pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personHandle, CFSTR("prh"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("sdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("edt"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_opt_class();
  v5 = objc_opt_new();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 8) = self->_requestId;
    v7 = -[NSString copyWithZone:](self->_pluginIdentifier, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

    v9 = -[NSString copyWithZone:](self->_personHandle, "copyWithZone:", a3);
    v10 = (void *)v6[3];
    v6[3] = v9;

    v11 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
    v12 = (void *)v6[4];
    v6[4] = v11;

    v13 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
    v14 = (void *)v6[5];
    v6[5] = v13;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  FIAPHistoricalDataRequest *v4;
  FIAPHistoricalDataRequest *v5;
  BOOL v6;

  v4 = (FIAPHistoricalDataRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[FIAPHistoricalDataRequest isEqualToHistoricalDataRequest:](self, "isEqualToHistoricalDataRequest:", v5);

  return v6;
}

- (BOOL)isEqualToHistoricalDataRequest:(id)a3
{
  id *v4;
  id *v5;
  NSString *personHandle;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *pluginIdentifier;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSDate *startDate;
  NSDate *v17;
  NSDate *v18;
  NSDate *v19;
  char v20;
  NSDate *endDate;
  NSDate *v22;
  NSDate *v23;
  NSDate *v24;
  char v25;
  BOOL v26;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  personHandle = self->_personHandle;
  v7 = (NSString *)v4[3];
  if (personHandle == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = personHandle;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_16;
  }
  pluginIdentifier = self->_pluginIdentifier;
  v12 = (NSString *)v5[2];
  if (pluginIdentifier == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = pluginIdentifier;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_16;
  }
  startDate = self->_startDate;
  v17 = (NSDate *)v5[4];
  if (startDate == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = startDate;
    v20 = -[NSDate isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_16;
  }
  endDate = self->_endDate;
  v22 = (NSDate *)v5[5];
  if (endDate == v22)
  {

    goto LABEL_19;
  }
  v23 = v22;
  v24 = endDate;
  v25 = -[NSDate isEqual:](v24, "isEqual:", v23);

  if ((v25 & 1) != 0)
  {
LABEL_19:
    v26 = self->_requestId == (_QWORD)v5[1];
    goto LABEL_17;
  }
LABEL_16:
  v26 = 0;
LABEL_17:

  return v26;
}

- (BOOL)_dateRangeIsSubsetOfHistoricalDataRequest:(id)a3
{
  NSDate *startDate;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  NSDate *endDate;
  uint64_t v9;
  unint64_t v10;

  startDate = self->_startDate;
  v5 = *((_QWORD *)a3 + 4);
  v6 = a3;
  v7 = -[NSDate compare:](startDate, "compare:", v5);
  endDate = self->_endDate;
  v9 = v6[5];

  v10 = -[NSDate compare:](endDate, "compare:", v9) + 1;
  return v7 < 2 && v10 < 2;
}

- (BOOL)subsetOfHistoricalDataRequest:(id)a3
{
  id *v4;
  NSString *personHandle;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  BOOL v10;

  v4 = (id *)a3;
  personHandle = self->_personHandle;
  v6 = (NSString *)v4[3];
  if (personHandle == v6)
  {

    goto LABEL_5;
  }
  v7 = v6;
  v8 = personHandle;
  v9 = -[NSString isEqual:](v8, "isEqual:", v7);

  if ((v9 & 1) != 0)
  {
LABEL_5:
    v10 = -[FIAPHistoricalDataRequest _dateRangeIsSubsetOfHistoricalDataRequest:](self, "_dateRangeIsSubsetOfHistoricalDataRequest:", v4);
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (unint64_t)requestId
{
  return self->_requestId;
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (NSString)personHandle
{
  return self->_personHandle;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_personHandle, 0);
  objc_storeStrong((id *)&self->_pluginIdentifier, 0);
}

+ (id)historicalDataRequestWithPersonHandle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  FIAPHistoricalDataRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FIAPHistoricalDataRequest initWithPersonHandle:startDate:endDate:]([FIAPHistoricalDataRequest alloc], "initWithPersonHandle:startDate:endDate:", v9, v8, v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
