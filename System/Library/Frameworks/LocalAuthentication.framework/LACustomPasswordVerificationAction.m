@implementation LACustomPasswordVerificationAction

- (id)initWithType:(id *)result
{
  if (result)
    return -[LACustomPasswordVerificationAction initWithType:customPassword:](result, a2, 0);
  return result;
}

- (id)initWithType:(void *)a3 customPassword:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)LACustomPasswordVerificationAction;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

+ (LACustomPasswordVerificationAction)terminateAction
{
  LACustomPasswordVerificationAction *v2;

  v2 = [LACustomPasswordVerificationAction alloc];
  if (v2)
    v2 = (LACustomPasswordVerificationAction *)-[LACustomPasswordVerificationAction initWithType:customPassword:]((id *)&v2->super.isa, 0, 0);
  return v2;
}

+ (LACustomPasswordVerificationAction)userCancelAction
{
  LACustomPasswordVerificationAction *v2;

  v2 = [LACustomPasswordVerificationAction alloc];
  if (v2)
    v2 = (LACustomPasswordVerificationAction *)-[LACustomPasswordVerificationAction initWithType:customPassword:]((id *)&v2->super.isa, (void *)1, 0);
  return v2;
}

+ (id)submitCustomPasswordAction:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[LACustomPasswordVerificationAction initWithType:customPassword:]((id *)[LACustomPasswordVerificationAction alloc], (void *)2, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unint64_t *)v4;
    v6 = v5;
    if (v5[1] == self->_type)
    {
      v7 = v5[2];
      if (v7 | (unint64_t)self->_customPassword)
        v8 = objc_msgSend((id)v7, "isEqualToString:");
      else
        v8 = 1;
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

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPassword, 0);
}

@end
