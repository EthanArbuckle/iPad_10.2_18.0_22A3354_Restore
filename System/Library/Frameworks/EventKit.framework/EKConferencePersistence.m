@implementation EKConferencePersistence

+ (id)serializeConference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  +[ConferenceDatatypeConverter calVirtualConferenceFromEKVirtualConference:](ConferenceDatatypeConverter, "calVirtualConferenceFromEKVirtualConference:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "joinMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKConferenceUtils synchronousAppTitleOnlyForURL:incomplete:](EKConferenceUtils, "synchronousAppTitleOnlyForURL:incomplete:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  EKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Video Call"), &stru_1E4789A58, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "serializationBlockTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v12 = v8;
  else
    v12 = v10;
  if (v11)
    v12 = v11;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0D0C280], "serializeConference:serializationBlockTitle:", v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)deserializeConference:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D0C280], "deserializeConference:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ConferenceDatatypeConverter ekDeserializationResultFromCalDeserializationResult:](ConferenceDatatypeConverter, "ekDeserializationResultFromCalDeserializationResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
