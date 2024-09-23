@implementation CHSWidgetRateLimit

- (CHSWidgetRateLimit)initWithMaximumRefreshes:(unint64_t)a3 perWindow:(double)a4
{
  CHSWidgetRateLimit *result;
  void *v9;
  void *v10;
  objc_super v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetRateLimit.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximum > 0"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidgetRateLimit.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRateLimit;
  result = -[CHSWidgetRateLimit init](&v11, sel_init);
  if (result)
  {
    result->_maximum = a3;
    result->_windowInSeconds = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_windowInSeconds - self->_maximum + 8 * self->_maximum;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetRateLimit *v4;
  BOOL v5;

  v4 = (CHSWidgetRateLimit *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_maximum == v4->_maximum
      && self->_windowInSeconds == v4->_windowInSeconds;
  }

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSWidgetRateLimit *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CHSWidgetRateLimit_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

void __51__CHSWidgetRateLimit_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 40) + 16));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:");

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_maximum), CFSTR("maximum"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("window"), self->_windowInSeconds);

}

- (CHSWidgetRateLimit)initWithCoder:(id)a3
{
  id v4;
  int v5;
  CHSWidgetRateLimit *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maximum"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("window"));
  v6 = -[CHSWidgetRateLimit initWithMaximumRefreshes:perWindow:](self, "initWithMaximumRefreshes:perWindow:", v5);

  return v6;
}

- (unint64_t)maximumRefreshes
{
  return self->_maximum;
}

- (double)window
{
  return self->_windowInSeconds;
}

@end
