@implementation fp_task_tracker

- (void)dealloc
{
  objc_super v3;

  free(self->label);
  v3.receiver = self;
  v3.super_class = (Class)fp_task_tracker;
  -[fp_task_tracker dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->group, 0);
}

@end
