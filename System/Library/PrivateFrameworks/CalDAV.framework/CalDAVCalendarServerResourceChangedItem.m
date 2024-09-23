@implementation CalDAVCalendarServerResourceChangedItem

- (CalDAVCalendarServerResourceChangedItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("resource-changed"));
}

- (void)addCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangedItem created](self, "created");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangedItem setCreated:](self, "setCreated:", v6);

  }
  -[CalDAVCalendarServerResourceChangedItem created](self, "created");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangedItem updated](self, "updated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangedItem setUpdated:](self, "setUpdated:", v6);

  }
  -[CalDAVCalendarServerResourceChangedItem updated](self, "updated");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addDeleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangedItem deleted](self, "deleted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangedItem setDeleted:](self, "setDeleted:", v6);

  }
  -[CalDAVCalendarServerResourceChangedItem deleted](self, "deleted");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addCollectionChanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangedItem collectionChanges](self, "collectionChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangedItem setCollectionChanges:](self, "setCollectionChanges:", v6);

  }
  -[CalDAVCalendarServerResourceChangedItem collectionChanges](self, "collectionChanges");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addCollectionUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangedItem collectionUpdates](self, "collectionUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangedItem setCollectionUpdates:](self, "setCollectionUpdates:", v6);

  }
  -[CalDAVCalendarServerResourceChangedItem collectionUpdates](self, "collectionUpdates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)setDtstampItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BEC6FB0];
  objc_msgSend(a3, "payloadAsString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromICSString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerResourceChangedItem setDtstamp:](self, "setDtstamp:", v5);

}

- (id)copyParseRules
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v15 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ADC8], CFSTR("created"), objc_opt_class(), sel_addCreated_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("created"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, v2, CFSTR("updated"), objc_opt_class(), sel_addUpdated_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("updated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, v2, CFSTR("deleted"), objc_opt_class(), sel_addDeleted_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, v2, CFSTR("collection-changes"), objc_opt_class(), sel_addCollectionChanges_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("collection-changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, v2, CFSTR("collection-update"), objc_opt_class(), sel_addCollectionUpdates_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("collection-update"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("dtstamp"), objc_opt_class(), sel_setDtstampItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("dtstamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v17, v14, v13, v12, v11, v3, v4, v5, v10, v6, v7, v8, 0);

  return v16;
}

- (NSMutableSet)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_deleted, a3);
}

- (NSMutableSet)collectionChanges
{
  return self->_collectionChanges;
}

- (void)setCollectionChanges:(id)a3
{
  objc_storeStrong((id *)&self->_collectionChanges, a3);
}

- (NSMutableSet)collectionUpdates
{
  return self->_collectionUpdates;
}

- (void)setCollectionUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_collectionUpdates, a3);
}

- (ICSDateValue)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
  objc_storeStrong((id *)&self->_dtstamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtstamp, 0);
  objc_storeStrong((id *)&self->_collectionUpdates, 0);
  objc_storeStrong((id *)&self->_collectionChanges, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
}

@end
