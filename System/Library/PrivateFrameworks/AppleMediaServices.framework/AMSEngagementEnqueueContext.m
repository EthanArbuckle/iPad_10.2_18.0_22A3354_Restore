@implementation AMSEngagementEnqueueContext

- (AMSEngagementEnqueueRequest)request
{
  return self->_request;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)setStart:(id)a3
{
  objc_storeStrong((id *)&self->_start, a3);
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (AMSEngagementEnqueueContext)init
{
  AMSEngagementEnqueueContext *v2;
  AMSEngagementEnqueueContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSEngagementEnqueueContext;
  v2 = -[AMSEngagementEnqueueContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AMSEngagementEnqueueContext setSignpostID:](v2, "setSignpostID:", 0);
  return v3;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (NSDate)start
{
  return self->_start;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
