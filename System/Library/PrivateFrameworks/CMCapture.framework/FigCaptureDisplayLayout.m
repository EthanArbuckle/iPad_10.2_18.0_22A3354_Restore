@implementation FigCaptureDisplayLayout

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureDisplayLayout debugDescription](self, "debugDescription"));
}

- (id)debugDescription
{
  void *v3;
  unint64_t displayType;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSArray count](self->_foregroundApps, "count"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("foreground:[%@]"), -[NSArray componentsJoinedByString:](self->_foregroundApps, "componentsJoinedByString:", CFSTR(","))));
  if (-[NSArray count](self->_obscuredApps, "count"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("obscured:[%@]"), -[NSArray componentsJoinedByString:](self->_obscuredApps, "componentsJoinedByString:", CFSTR(","))));
  if (-[NSArray count](self->_transitioningApps, "count"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transitioning:[%@]"), -[NSArray componentsJoinedByString:](self->_transitioningApps, "componentsJoinedByString:", CFSTR(","))));
  if (-[NSArray count](self->_pipApps, "count"))
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pip:[%@]"), -[NSArray componentsJoinedByString:](self->_pipApps, "componentsJoinedByString:", CFSTR(","))));
  if (self->_siriVisible)
    objc_msgSend(v3, "addObject:", CFSTR("siri: 1"));
  if (self->_paymentServiceVisible)
    objc_msgSend(v3, "addObject:", CFSTR("paymentService: 1"));
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("ništa"));
  displayType = self->_displayType;
  if (displayType <= 2)
    objc_msgSend(v3, "insertObject:atIndex:", off_1E49238D0[displayType], 0);
  if (self->_timestamp)
    objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend((id)sLayoutTimestampDateFormatter, "stringFromDate:"), 0);
  return (id)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
}

- (void)setPaymentServiceVisible:(BOOL)a3
{
  self->_paymentServiceVisible = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDisplayLayout;
  -[FigCaptureDisplayLayout dealloc](&v3, sel_dealloc);
}

- (void)setTransitioningApps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setSiriVisible:(BOOL)a3
{
  self->_siriVisible = a3;
}

- (void)setPipApps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setObscuredApps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setForegroundApps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setDisplayType:(int64_t)a3
{
  self->_displayType = a3;
}

- (id)_init
{
  FigCaptureDisplayLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureDisplayLayout;
  v2 = -[FigCaptureDisplayLayout init](&v4, sel_init);
  if (v2)
  {
    v2->_foregroundApps = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_obscuredApps = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_transitioningApps = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_pipApps = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return v2;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)foregroundApps
{
  return self->_foregroundApps;
}

- (NSArray)transitioningApps
{
  return self->_transitioningApps;
}

- (BOOL)isPaymentServiceVisible
{
  return self->_paymentServiceVisible;
}

- (int64_t)displayType
{
  return self->_displayType;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLayoutTimestampDateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend((id)sLayoutTimestampDateFormatter, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm:ss"));
  }
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSArray)obscuredApps
{
  return self->_obscuredApps;
}

- (NSArray)pipApps
{
  return self->_pipApps;
}

- (BOOL)isSiriVisible
{
  return self->_siriVisible;
}

@end
