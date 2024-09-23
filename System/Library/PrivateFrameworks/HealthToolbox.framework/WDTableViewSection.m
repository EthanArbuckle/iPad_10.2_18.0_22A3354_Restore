@implementation WDTableViewSection

- (WDTableViewSection)initWithDelegate:(id)a3 atSection:(unint64_t)a4
{
  id v6;
  WDTableViewSection *v7;
  WDTableViewSection *v8;
  WDTableViewSection *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDTableViewSection;
  v7 = -[WDTableViewSection init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_section = a4;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (void)reloadAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSection:animated:", self->_section, v3);

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
  return *MEMORY[0x24BE4A140];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x24BDF7DE0];
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Must be subclassed."));
  return 0;
}

- (id)willSelectRow:(id)a3
{
  return a3;
}

- (WDTableViewSectionDelegate)delegate
{
  return (WDTableViewSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)section
{
  return self->_section;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
