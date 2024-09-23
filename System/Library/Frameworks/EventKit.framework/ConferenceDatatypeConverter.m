@implementation ConferenceDatatypeConverter

+ (id)ekDeserializationResultFromCalDeserializationResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EKConferenceDeserializationResult *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EKConferenceDeserializationResult *v12;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "conference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_ekVirtualConferenceFromCalVirtualConference:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "blockTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSerializationBlockTitle:", v7);

    v8 = [EKConferenceDeserializationResult alloc];
    v9 = objc_msgSend(v4, "range");
    v11 = v10;

    v12 = -[EKConferenceDeserializationResult initWithConference:range:](v8, "initWithConference:range:", v6, v9, v11);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)calVirtualConferenceFromEKVirtualConference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "joinMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_calJoinMethodsFromEKJoinMethods:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "_calSourceFromEKSource:", objc_msgSend(v4, "source"));
  v8 = objc_alloc(MEMORY[0x1E0D0C3E8]);
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conferenceDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isWritable");

  v12 = (void *)objc_msgSend(v8, "initWithTitle:joinMethods:conferenceDetails:source:isWritable:", v9, v6, v10, v7, v11);
  return v12;
}

+ (id)_ekVirtualConferenceFromCalVirtualConference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  EKVirtualConference *v8;
  void *v9;
  void *v10;
  EKVirtualConference *v11;

  v4 = a3;
  objc_msgSend(v4, "joinMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ekJoinMethodsFromCalJoinMethods:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "_ekSourceFromCalSource:", objc_msgSend(v4, "source"));
  v8 = [EKVirtualConference alloc];
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conferenceDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[EKVirtualConference initWithTitle:joinMethods:conferenceDetails:](v8, "initWithTitle:joinMethods:conferenceDetails:", v9, v6, v10);
  -[EKVirtualConference setSource:](v11, "setSource:", v7);

  return v11;
}

+ (id)_calJoinMethodFromEKJoinMethod:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D0C3F0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isBroadcast");

  v9 = (void *)objc_msgSend(v5, "initWithTitle:URL:isBroadcast:", v6, v7, v8);
  return v9;
}

+ (id)_calJoinMethodsFromEKJoinMethods:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ConferenceDatatypeConverter__calJoinMethodsFromEKJoinMethods___block_invoke;
  v4[3] = &__block_descriptor_40_e71___CalVirtualConferenceJoinMethod_16__0__EKVirtualConferenceJoinMethod_8l;
  v4[4] = a1;
  objc_msgSend(a3, "CalMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __64__ConferenceDatatypeConverter__calJoinMethodsFromEKJoinMethods___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_calJoinMethodFromEKJoinMethod:", a2);
}

+ (id)_ekJoinMethodFromCalJoinMethod:(id)a3
{
  id v3;
  EKVirtualConferenceJoinMethod *v4;
  void *v5;
  void *v6;
  EKVirtualConferenceJoinMethod *v7;
  uint64_t v8;

  v3 = a3;
  v4 = [EKVirtualConferenceJoinMethod alloc];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKVirtualConferenceJoinMethod initWithTitle:url:](v4, "initWithTitle:url:", v5, v6);

  v8 = objc_msgSend(v3, "isBroadcast");
  -[EKVirtualConferenceJoinMethod setIsBroadcast:](v7, "setIsBroadcast:", v8);
  return v7;
}

+ (id)_ekJoinMethodsFromCalJoinMethods:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ConferenceDatatypeConverter__ekJoinMethodsFromCalJoinMethods___block_invoke;
  v4[3] = &__block_descriptor_40_e71___EKVirtualConferenceJoinMethod_16__0__CalVirtualConferenceJoinMethod_8l;
  v4[4] = a1;
  objc_msgSend(a3, "CalMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __64__ConferenceDatatypeConverter__ekJoinMethodsFromCalJoinMethods___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ekJoinMethodFromCalJoinMethod:", a2);
}

+ (unint64_t)_calSourceFromEKSource:(unint64_t)a3
{
  return a3 != 0;
}

+ (unint64_t)_ekSourceFromCalSource:(unint64_t)a3
{
  return a3 != 0;
}

@end
