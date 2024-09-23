@implementation _GEOThrottledTicket

+ (id)ticket:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setTicket:", v6);
    objc_msgSend(v9, "setSubmissionHandler:", v7);
    objc_msgSend(v9, "setQos:", qos_class_self());
    objc_msgSend(v9, "setSafeTime:", 0.0);
  }

  return v9;
}

- (GEOMapServiceThrottlableTicket)ticket
{
  return self->ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->ticket, a3);
}

- (id)submissionHandler
{
  return self->submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)qos
{
  return self->qos;
}

- (void)setQos:(unsigned int)a3
{
  self->qos = a3;
}

- (double)safeTime
{
  return self->safeTime;
}

- (void)setSafeTime:(double)a3
{
  self->safeTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->submissionHandler, 0);
  objc_storeStrong((id *)&self->ticket, 0);
}

@end
