@implementation EFCancelationToken

+ (EFCancelationToken)tokenWithCancelationBlock:(id)a3
{
  id v3;
  EFCancelationToken *v4;

  v3 = a3;
  v4 = objc_alloc_init(EFCancelationToken);
  -[EFCancelationToken addCancelationBlock:](v4, "addCancelationBlock:", v3);

  return v4;
}

- (void)addCancelable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__EFCancelationToken_addCancelable___block_invoke;
  v6[3] = &unk_1E62A5860;
  v7 = v4;
  v5 = v4;
  -[EFCancelationToken addCancelationBlock:](self, "addCancelationBlock:", v6);

}

+ (id)_descriptionString
{
  return CFSTR("canceled");
}

uint64_t __36__EFCancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

+ (EFCancelationToken)tokenWithLabel:(id)a3 cancelationBlock:(id)a4
{
  id v5;
  id v6;
  EFCancelationToken *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[EFInvocationToken initWithLabel:]([EFCancelationToken alloc], "initWithLabel:", v5);
  -[EFCancelationToken addCancelationBlock:](v7, "addCancelationBlock:", v6);

  return v7;
}

@end
