@implementation HRWDTableViewSection

- (HRWDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4
{
  HRWDTableViewSection *v6;
  HRWDTableViewSection *v7;
  HRWDTableViewSection *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HRWDTableViewSection;
  v6 = -[HRWDTableViewSection init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_delegate = (HRWDTableViewSectionDelegate *)a3;
    v6->_section = a4;
    v8 = v6;
  }

  return v7;
}

- (void)reloadAnimated:(BOOL)a3
{
  -[HRWDTableViewSectionDelegate reloadSection:animated:](self->_delegate, "reloadSection:animated:", self->_section, a3);
}

- (id)viewForHeader:(id)a3
{
  return 0;
}

- (id)titleForHeader
{
  return 0;
}

- (id)viewForFooter:(id)a3
{
  return 0;
}

- (id)titleForFooter
{
  return 0;
}

- (unint64_t)numberOfRows
{
  return 0;
}

- (double)heightForHeader
{
  return 0.0;
}

- (double)heightForFooter
{
  return 0.0;
}

- (double)estimatedHeightForRow:(unint64_t)a3
{
  return *MEMORY[0x1E0D2F500];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Must be subclassed."));
  return 0;
}

- (id)willSelectRow:(id)a3
{
  return a3;
}

- (HRWDTableViewSectionDelegate)delegate
{
  return self->_delegate;
}

- (unint64_t)section
{
  return self->_section;
}

@end
