@implementation APKActivityProgress

- (APKActivityProgress)initWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4 cancelled:(BOOL)a5 shouldHideProgressUI:(BOOL)a6
{
  APKActivityProgress *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APKActivityProgress;
  result = -[APKActivityProgress init](&v11, sel_init);
  if (result)
  {
    result->_completedUnitCount = a3;
    result->_totalUnitCount = a4;
    result->_cancelled = a5;
    result->_shouldHideProgressUI = a6;
  }
  return result;
}

- (APKActivityProgress)initWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  APKActivityProgress *v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HideProgressCircleInUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "completedUnitCount");
  v8 = objc_msgSend(v4, "totalUnitCount");
  v9 = objc_msgSend(v4, "isCancelled");

  v10 = -[APKActivityProgress initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:](self, "initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:", v7, v8, v9, objc_msgSend(v6, "BOOLValue"));
  return v10;
}

- (id)ns
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", -[APKActivityProgress totalUnitCount](self, "totalUnitCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletedUnitCount:", -[APKActivityProgress completedUnitCount](self, "completedUnitCount"));
  if (-[APKActivityProgress cancelled](self, "cancelled"))
    objc_msgSend(v3, "cancel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[APKActivityProgress shouldHideProgressUI](self, "shouldHideProgressUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfoObject:forKey:", v4, CFSTR("HideProgressCircleInUI"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[APKActivityProgress completedUnitCount](self, "completedUnitCount"), CFSTR("completedUnitCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[APKActivityProgress totalUnitCount](self, "totalUnitCount"), CFSTR("totalUnitCount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[APKActivityProgress cancelled](self, "cancelled"), CFSTR("cancelled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[APKActivityProgress shouldHideProgressUI](self, "shouldHideProgressUI"), CFSTR("shouldHideProgressUI"));

}

- (APKActivityProgress)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("completedUnitCount"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalUnitCount"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelled"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHideProgressUI"));

  return -[APKActivityProgress initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:](self, "initWithCompletedUnitCount:totalUnitCount:cancelled:shouldHideProgressUI:", v5, v6, v7, v8);
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)shouldHideProgressUI
{
  return self->_shouldHideProgressUI;
}

- (void)setShouldHideProgressUI:(BOOL)a3
{
  self->_shouldHideProgressUI = a3;
}

@end
