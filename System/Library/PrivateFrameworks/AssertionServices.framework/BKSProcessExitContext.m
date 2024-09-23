@implementation BKSProcessExitContext

- (uint64_t)setExitReason:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBKSProcessExitReason(-[BKSProcessExitContext exitReason](self, "exitReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| reason:%@>"), v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_exitReason, CFSTR("_exitReason"));
}

- (BKSProcessExitContext)initWithCoder:(id)a3
{
  id v4;
  BKSProcessExitContext *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSProcessExitContext;
  v5 = -[BKSProcessExitContext init](&v7, sel_init);
  if (v5)
    v5->_exitReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_exitReason"));

  return v5;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

@end
