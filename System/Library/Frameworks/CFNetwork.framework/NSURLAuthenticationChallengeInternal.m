@implementation NSURLAuthenticationChallengeInternal

- (_QWORD)initWithProtectionSpace:(void *)a3 proposedCredential:(uint64_t)a4 previousFailureCount:(void *)a5 failureResponse:(void *)a6 error:(void *)a7 sender:
{
  _QWORD *v13;
  id v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)NSURLAuthenticationChallengeInternal;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  if (v13)
  {
    v13[1] = a2;
    v13[2] = a3;
    v13[3] = a4;
    v13[4] = a5;
    v13[5] = a6;
    v14 = a7;
    v13[7] = 0;
    v13[8] = 0;
    v13[6] = v14;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLAuthenticationChallengeInternal;
  -[NSURLAuthenticationChallengeInternal dealloc](&v3, sel_dealloc);
}

@end
