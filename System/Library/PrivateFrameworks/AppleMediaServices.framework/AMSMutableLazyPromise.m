@implementation AMSMutableLazyPromise

- (AMSMutableLazyPromise)initWithBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSMutableLazyPromise;
  return -[AMSLazyPromise initWithBlock:](&v4, sel_initWithBlock_, a3);
}

- (AMSMutableLazyPromise)initWithTimeout:(double)a3 block:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSMutableLazyPromise;
  return -[AMSLazyPromise initWithTimeout:block:](&v5, sel_initWithTimeout_block_, a4, a3);
}

- (BOOL)cancel
{
  return +[AMSMutablePromise cancelPromise:](AMSMutablePromise, "cancelPromise:", self);
}

- (BOOL)finishWithError:(id)a3
{
  return -[AMSMutableLazyPromise finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutablePromise finishPromise:withPromise:](AMSMutablePromise, "finishPromise:withPromise:", self, a3);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[AMSMutableLazyPromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", self, a3, a4);
}

@end
