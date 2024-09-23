@implementation CNContact

- (BOOL)canExceedUnifyingThreshold
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact phoneNumbers](self, "phoneNumbers"));
  if ((unint64_t)objc_msgSend(v3, "count") > 0x14)
  {
    v5 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact emailAddresses](self, "emailAddresses"));
    if ((unint64_t)objc_msgSend(v4, "count") <= 0x14)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact postalAddresses](self, "postalAddresses"));
      if ((unint64_t)objc_msgSend(v6, "count") <= 0x14)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact urlAddresses](self, "urlAddresses"));
        if ((unint64_t)objc_msgSend(v7, "count") <= 0x14)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact contactRelations](self, "contactRelations"));
          if ((unint64_t)objc_msgSend(v8, "count") <= 0x14)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact socialProfiles](self, "socialProfiles"));
            if ((unint64_t)objc_msgSend(v9, "count") <= 0x14)
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact instantMessageAddresses](self, "instantMessageAddresses"));
              v5 = (unint64_t)objc_msgSend(v10, "count") > 0x14;

            }
            else
            {
              v5 = 1;
            }

          }
          else
          {
            v5 = 1;
          }

        }
        else
        {
          v5 = 1;
        }

      }
      else
      {
        v5 = 1;
      }

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (id)labeledValueForEmailAddress:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CNContactEmailAddressesKey))
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CNContact emailAddresses](self, "emailAddresses"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "isSuggested", (_QWORD)v13) & 1) == 0)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
            v11 = objc_msgSend(v10, "isEqualToString:", v4);

            if (v11)
            {
              v6 = v9;
              goto LABEL_14;
            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)labeledValueForPhoneNumber:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CNContactPhoneNumbersKey))
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CNContact phoneNumbers](self, "phoneNumbers"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "isSuggested", (_QWORD)v13) & 1) == 0)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
            v11 = objc_msgSend(v10, "isLikePhoneNumber:", v4);

            if (v11)
            {
              v6 = v9;
              goto LABEL_14;
            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)labeledValueForSocialProfileWithUsername:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (-[CNContact isKeyAvailable:](self, "isKeyAvailable:", CNContactSocialProfilesKey))
  {
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CNContact socialProfiles](self, "socialProfiles"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value", (_QWORD)v14));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username"));
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
          {
            v6 = v9;

            goto LABEL_13;
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)labeledValueForTelephoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact labeledValueForPhoneNumber:](self, "labeledValueForPhoneNumber:", v5));
  }
  else
  {
    v7 = PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000527E8((uint64_t)v4, v8);

    v6 = 0;
  }

  return v6;
}

@end
