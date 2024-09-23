@implementation CalDAVUpdateOwnerItem

- (id)description
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CalDAVUpdateOwnerItem firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem address](self, "address");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v10 = 0;
    v11 = (void *)v8;
  }
  else
  {
    -[CalDAVUpdateOwnerItem emailAddress](self, "emailAddress");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10 = 0;
      v2 = (void *)v12;
      v11 = (void *)v12;
    }
    else
    {
      -[CalDAVUpdateOwnerItem phoneNumber](self, "phoneNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = 0;
      v10 = 1;
    }
  }
  -[CalDAVUpdateOwnerItem dtstamp](self, "dtstamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("[<%@ %p> %@ %@ \"%@\" %@ %@]"), v4, self, v5, v6, v7, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  if (!v9)

  return v14;
}

- (void)setAddressItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsFullURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setAddress:](self, "setAddress:", v4);

}

- (void)setEmailAddressItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setEmailAddress:](self, "setEmailAddress:", v4);

}

- (void)setDisplayNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setDisplayName:](self, "setDisplayName:", v4);

}

- (void)setFirstNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setFirstName:](self, "setFirstName:", v4);

}

- (void)setLastNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setLastName:](self, "setLastName:", v4);

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
  -[CalDAVUpdateOwnerItem setDtstamp:](self, "setDtstamp:", v5);

}

- (void)setPhoneNumberItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateOwnerItem setPhoneNumber:](self, "setPhoneNumber:", v4);

}

- (id)copyParseRules
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v21 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1AE30];
  v3 = *MEMORY[0x24BE1AE70];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70], objc_opt_class(), sel_setAddressItem_);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE1ADC8];
  v5 = *MEMORY[0x24BE1AD60];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD60], objc_opt_class(), sel_setEmailAddressItem_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE1AD80];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, *MEMORY[0x24BE1AD80], objc_opt_class(), sel_setPhoneNumberItem_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE1AE38];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AE38], objc_opt_class(), sel_setDisplayNameItem_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("first-name"), objc_opt_class(), sel_setFirstNameItem_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("first-name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("last-name"), objc_opt_class(), sel_setLastNameItem_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("last-name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("dtstamp"), objc_opt_class(), sel_setDtstampItem_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("dtstamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v24, v23, v20, v19, v18, v17, v16, v14, v15, v13, v8, v9, v10, v11, 0);

  return v22;
}

- (ICSDateValue)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
  objc_storeStrong((id *)&self->_dtstamp, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSURL)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end
