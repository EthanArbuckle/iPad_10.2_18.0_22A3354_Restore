@implementation EKUICommunicationUtilities

+ (id)attendeesIgnoringMe:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Extracting all attendees except 'me.'", buf, 2u);
  }
  objc_msgSend(v4, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__EKUICommunicationUtilities_attendeesIgnoringMe___block_invoke;
  v15[3] = &unk_1E60193A8;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);
  v12 = objc_msgSend(v4, "isSelfOrganized");

  if ((v12 & 1) == 0)
  {
    v13 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Adding the 'organizer': [%@]", buf, 0xCu);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

  return v5;
}

uint64_t __50__EKUICommunicationUtilities_attendeesIgnoringMe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "Inspecting attendee: [%@]", (uint8_t *)&v11, 0xCu);
  }
  if (objc_msgSend(v3, "isCurrentUser"))
  {
    v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "This attendee is 'me' so it will not be extracted: [%@]";
LABEL_9:
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v7 = objc_msgSend(v3, "isEqualToParticipant:", *(_QWORD *)(a1 + 32));
  v5 = kEKUILogHandle;
  v8 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "This attendee is the 'organizer' so it will be skipped for now: [%@]";
      goto LABEL_9;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Extracting attendee: [%@]", (uint8_t *)&v11, 0xCu);
  }
  v9 = 1;
LABEL_14:

  return v9;
}

@end
