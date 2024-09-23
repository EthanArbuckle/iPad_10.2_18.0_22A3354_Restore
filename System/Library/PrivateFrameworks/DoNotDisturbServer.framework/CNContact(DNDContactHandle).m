@implementation CNContact(DNDContactHandle)

+ (id)dnds_predicateForContactsMatchingEventSender:()DNDContactHandle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForContactsWithIdentifiers:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "destinationIdIsPhoneNumber") & 1) != 0 || objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:prefixHint:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(a1, "predicateForContactsMatchingEmailAddress:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_7:

  return v9;
}

@end
