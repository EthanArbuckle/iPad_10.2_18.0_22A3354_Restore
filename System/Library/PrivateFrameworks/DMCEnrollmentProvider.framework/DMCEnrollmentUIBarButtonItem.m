@implementation DMCEnrollmentUIBarButtonItem

- (DMCEnrollmentUIBarButtonItem)initWithType:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  DMCEnrollmentUIBarButtonItem *v10;
  void *v11;
  uint64_t v12;
  DMCEnrollmentUIBarButtonItem *v13;

  v8 = a4;
  switch(a3)
  {
    case 0uLL:

      self = 0;
      goto LABEL_10;
    case 1uLL:
      DMCLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v9;
      v12 = 0;
      goto LABEL_6;
    case 2uLL:
    case 4uLL:
      DMCLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self;
      v11 = v9;
      v12 = 2;
LABEL_6:
      v13 = -[DMCEnrollmentUIBarButtonItem initWithTitle:style:target:action:](v10, "initWithTitle:style:target:action:", v11, v12, v8, a5);
      goto LABEL_7;
    case 3uLL:
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v9, "startAnimating");
      v13 = -[DMCEnrollmentUIBarButtonItem initWithCustomView:](self, "initWithCustomView:", v9);
LABEL_7:
      self = v13;

      break;
    default:
      break;
  }
  if (self)
    self->_type = a3;
LABEL_10:

  return self;
}

- (unint64_t)type
{
  return self->_type;
}

@end
