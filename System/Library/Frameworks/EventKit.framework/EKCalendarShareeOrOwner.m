@implementation EKCalendarShareeOrOwner

+ (id)shareeWithEKSharee:(id)a3 forCalendar:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___EKCalendarShareeOrOwner;
  v8 = objc_msgSend(objc_msgSendSuper2(&v21, sel_alloc), "init");
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setName:", v9);

  objc_msgSend(v6, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setEmailAddress:", v10);

  objc_msgSend(v6, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setPhoneNumber:", v11);

  objc_msgSend(v6, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setFirstName:", v12);

  objc_msgSend(v6, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setLastName:", v13);

  objc_msgSend(v6, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setURL:", v14);

  objc_msgSend(v6, "UUID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v15;

  if (objc_msgSend(v7, "sharingStatus"))
  {
    objc_msgSend(v7, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ownerAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v8 + 8) = objc_msgSend(v18, "containsObject:", v19);

  }
  else
  {
    *(_BYTE *)(v8 + 8) = 0;
  }

  return (id)v8;
}

+ (id)ownerForEKCalendar:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  if (objc_msgSend(v4, "sharingStatus"))
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___EKCalendarShareeOrOwner;
    v5 = objc_msgSend(objc_msgSendSuper2(&v15, sel_alloc), "init");
    objc_msgSend(v4, "ownerIdentityDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setName:", v6);

    objc_msgSend(v4, "ownerIdentityEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setEmailAddress:", v7);

    objc_msgSend(v4, "ownerIdentityPhoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setPhoneNumber:", v8);

    objc_msgSend(v4, "ownerIdentityFirstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setFirstName:", v9);

    objc_msgSend(v4, "ownerIdentityLastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setLastName:", v10);

    objc_msgSend(v4, "ownerIdentityAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setURL:", v11);

    objc_msgSend(v4, "uniqueIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v12;

    *(_BYTE *)(v5 + 8) = objc_msgSend(v4, "sharingStatus") == 1;
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (BOOL)isCurrentUserForScheduling
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  EKCalendarShareeOrOwner *v4;
  EKCalendarShareeOrOwner *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (EKCalendarShareeOrOwner *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_7;
  }
  if (-[EKCalendarShareeOrOwner conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EE687D28))
  {
    -[EKCalendarShareeOrOwner UUID](v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarShareeOrOwner UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EKCalendarShareeOrOwner UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isCurrentUserForSharing
{
  return self->_isCurrentUserForSharing;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
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

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
