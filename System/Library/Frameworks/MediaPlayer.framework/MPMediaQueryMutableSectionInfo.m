@implementation MPMediaQueryMutableSectionInfo

- (void)addSectionWithHeaderTitle:(id)a3 sectionIndexTitleIndex:(unint64_t)a4 count:(unint64_t)a5
{
  id v8;
  NSArray *sections;
  NSArray *v10;
  NSArray *v11;
  id v12;

  v8 = a3;
  v12 = -[MPMediaQuerySection _init]([MPMediaQuerySection alloc], "_init");
  objc_msgSend(v12, "setTitle:", v8);

  objc_msgSend(v12, "setSectionIndexTitleIndex:", a4);
  objc_msgSend(v12, "setRange:", -[MPMediaQuerySectionInfo count](self, "count"), a5);
  sections = self->super._sections;
  if (!sections)
  {
    v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v11 = self->super._sections;
    self->super._sections = v10;

    sections = self->super._sections;
  }
  -[NSArray addObject:](sections, "addObject:", v12);

}

@end
