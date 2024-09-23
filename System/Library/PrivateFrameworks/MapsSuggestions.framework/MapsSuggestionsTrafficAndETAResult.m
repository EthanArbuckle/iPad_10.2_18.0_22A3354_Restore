@implementation MapsSuggestionsTrafficAndETAResult

- (MapsSuggestionsTrafficAndETAResult)initWithGEOTrafficAndETAResult:(id)a3
{
  id v4;
  MapsSuggestionsTrafficAndETAResult *v5;
  double v6;
  uint64_t v7;
  NSString *shortTrafficString;
  uint64_t v9;
  NSString *longTrafficString;
  uint64_t v11;
  NSString *writtenRouteName;
  uint64_t v13;
  NSString *spokenRouteName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsTrafficAndETAResult;
  v5 = -[MapsSuggestionsTrafficAndETAResult init](&v16, sel_init);
  if (v5)
  {
    v5->_isSuccess = objc_msgSend(v4, "isSuccess");
    objc_msgSend(v4, "seconds");
    v5->_seconds = v6;
    objc_msgSend(v4, "shortTrafficString");
    v7 = objc_claimAutoreleasedReturnValue();
    shortTrafficString = v5->_shortTrafficString;
    v5->_shortTrafficString = (NSString *)v7;

    objc_msgSend(v4, "longTrafficString");
    v9 = objc_claimAutoreleasedReturnValue();
    longTrafficString = v5->_longTrafficString;
    v5->_longTrafficString = (NSString *)v9;

    objc_msgSend(v4, "writtenRouteName");
    v11 = objc_claimAutoreleasedReturnValue();
    writtenRouteName = v5->_writtenRouteName;
    v5->_writtenRouteName = (NSString *)v11;

    objc_msgSend(v4, "spokenRouteName");
    v13 = objc_claimAutoreleasedReturnValue();
    spokenRouteName = v5->_spokenRouteName;
    v5->_spokenRouteName = (NSString *)v13;

  }
  return v5;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (double)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(double)a3
{
  self->_seconds = a3;
}

- (NSString)shortTrafficString
{
  return self->_shortTrafficString;
}

- (void)setShortTrafficString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)longTrafficString
{
  return self->_longTrafficString;
}

- (void)setLongTrafficString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)writtenRouteName
{
  return self->_writtenRouteName;
}

- (void)setWrittenRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)spokenRouteName
{
  return self->_spokenRouteName;
}

- (void)setSpokenRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_longTrafficString, 0);
  objc_storeStrong((id *)&self->_shortTrafficString, 0);
}

@end
