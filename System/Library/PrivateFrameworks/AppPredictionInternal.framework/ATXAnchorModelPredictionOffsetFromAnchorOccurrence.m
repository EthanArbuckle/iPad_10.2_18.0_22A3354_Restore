@implementation ATXAnchorModelPredictionOffsetFromAnchorOccurrence

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithStartSecondsAfterAnchor:(double)a3 endSecondsAfterAnchor:(double)a4
{
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelPredictionOffsetFromAnchorOccurrence;
  result = -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence init](&v7, sel_init);
  if (result)
  {
    result->_startSecondsAfterAnchor = a3;
    result->_endSecondsAfterAnchor = a4;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Start seconds after anchor: %.2f, End seconds after anchor: %.2f"), *(_QWORD *)&self->_startSecondsAfterAnchor, *(_QWORD *)&self->_endSecondsAfterAnchor);
}

- (BOOL)isEqual:(id)a3
{
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v4;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v5;
  double startSecondsAfterAnchor;
  double v7;
  BOOL v8;
  double endSecondsAfterAnchor;
  double v10;

  v4 = (ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      startSecondsAfterAnchor = self->_startSecondsAfterAnchor;
      -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence startSecondsAfterAnchor](v5, "startSecondsAfterAnchor");
      if (startSecondsAfterAnchor == v7)
      {
        endSecondsAfterAnchor = self->_endSecondsAfterAnchor;
        -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence endSecondsAfterAnchor](v5, "endSecondsAfterAnchor");
        v8 = endSecondsAfterAnchor == v10;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)self->_endSecondsAfterAnchor
       - (unint64_t)self->_startSecondsAfterAnchor
       + 32 * (unint64_t)self->_startSecondsAfterAnchor;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double startSecondsAfterAnchor;
  id v5;

  startSecondsAfterAnchor = self->_startSecondsAfterAnchor;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startSeconds"), startSecondsAfterAnchor);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endSeconds"), self->_endSecondsAfterAnchor);

}

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  ATXAnchorModelPredictionOffsetFromAnchorOccurrence *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startSeconds"));
  v6 = v5;
  if (-[ATXAnchorModelPredictionOffsetFromAnchorOccurrence checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("startSeconds"), v4, CFSTR("endSeconds"), -1)|| (objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endSeconds")), v8 = v7, -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("endSeconds"), v4, CFSTR("endSeconds"), -1)))
  {
    v9 = 0;
  }
  else
  {
    self = -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:](self, "initWithStartSecondsAfterAnchor:endSecondsAfterAnchor:", v6, v8);
    v9 = self;
  }

  return v9;
}

- (double)startSecondsAfterAnchor
{
  return self->_startSecondsAfterAnchor;
}

- (double)endSecondsAfterAnchor
{
  return self->_endSecondsAfterAnchor;
}

@end
