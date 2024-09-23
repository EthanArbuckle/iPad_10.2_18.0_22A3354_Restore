@implementation SUUIMenuPageSectionContext

- (id)sectionsForIndex:(int64_t)a3
{
  NSMutableDictionary *sections;
  void *v4;
  void *v5;

  sections = self->_sections;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sections, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSections:(id)a3 forIndex:(int64_t)a4
{
  NSMutableDictionary *sections;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  sections = self->_sections;
  if (!sections)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = self->_sections;
    self->_sections = v7;

    sections = self->_sections;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sections, "setObject:forKey:", v10, v9);

}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
