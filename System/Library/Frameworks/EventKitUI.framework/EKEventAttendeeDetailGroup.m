@implementation EKEventAttendeeDetailGroup

- (id)itemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[EKEventDetailGroup items](self, "items", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
