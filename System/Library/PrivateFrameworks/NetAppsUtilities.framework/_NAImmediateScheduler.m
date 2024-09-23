@implementation _NAImmediateScheduler

- (void)performBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)performCancelableBlock:(id)a3
{
  void (**v3)(id, NACancelationToken *);
  NACancelationToken *v4;

  v3 = (void (**)(id, NACancelationToken *))a3;
  v4 = objc_alloc_init(NACancelationToken);
  v3[2](v3, v4);

  return v4;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  void *v5;
  void (**v6)(_QWORD);

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "sleepForTimeInterval:", a3);
  v6[2](v6);

  return objc_alloc_init(NACancelationToken);
}

@end
