@implementation GDFeedbackService

- (GDFeedbackService)init
{
  GDFeedbackService *v2;
  GDFeedbackServiceInner *v3;
  GDFeedbackServiceInner *inner;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GDFeedbackService;
  v2 = -[GDFeedbackService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GDFeedbackServiceInner);
    inner = v2->_inner;
    v2->_inner = v3;

  }
  return v2;
}

- (BOOL)recordFeedback:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self->_inner, sel_objcRecordWithFeedback_error_, a3);
}

- (BOOL)recordFeedback:(id)a3 forEvent:(int64_t)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self->_inner, sel_objcRecordWithFeedback_for_error_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

@end
