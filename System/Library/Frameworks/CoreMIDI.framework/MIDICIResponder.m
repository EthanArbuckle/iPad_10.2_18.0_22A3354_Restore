@implementation MIDICIResponder

- (MIDICIResponder)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MIDICIResponder init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported! Don't call %@."), v4);

  return 0;
}

- (MIDICIResponder)initWithDeviceInfo:(MIDICIDeviceInfo *)deviceInfo profileDelegate:(id)delegate profileStates:(MIDICIProfileStateList *)profileList supportProperties:(BOOL)propertiesSupported
{
  _BOOL4 v6;
  MIDICIDeviceInfo *v11;
  id v12;
  MIDICIProfileStateList *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  MIDICIResponder *v16;
  MIDICIResponder *v17;
  objc_super v19;

  v6 = propertiesSupported;
  v11 = deviceInfo;
  v12 = delegate;
  v13 = profileList;
  v14 = -[MIDICIResponder containsValidChannels:](self, "containsValidChannels:", v13);
  if (v11 && (v15 = v14, -[MIDICIDeviceInfo midiDestination](v11, "midiDestination")) && (v6 || v15))
  {
    v19.receiver = self;
    v19.super_class = (Class)MIDICIResponder;
    v16 = -[MIDICIResponder init](&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_profileDelegate, delegate);
      v17->_isStarted = 0;
      v17->_propertiesSupported = v6;
      objc_storeStrong((id *)&v17->_deviceInfo, deviceInfo);
    }
  }
  else
  {
    v17 = self;
  }

  return 0;
}

- (id)description
{
  void *v3;
  MIDICIProfileResponderDelegate *profileDelegate;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  profileDelegate = self->_profileDelegate;
  -[MIDICIResponder initiators](self, "initiators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MIDICIResponder(%p): delegate:%@ initiators:%@> "), self, profileDelegate, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)containsValidChannels:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  unsigned int v8;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "midiChannel", (_QWORD)v12);
        v10 = v8 < 0x10 || v8 == 127;

        if (v10)
        {
          LOBYTE(v4) = 1;
          goto LABEL_17;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_17:

  return v4;
}

- (void)registerProfiles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  unsigned int v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  FILE *v31;
  uint64_t v32;
  uint64_t m;
  uint64_t n;
  int v35;
  BOOL v36;
  std::string::value_type *v37;
  std::string *v38;
  id v39;
  id obj;
  uint64_t v41;
  std::string v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  FILE *v57;
  std::string::value_type *__s;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v39;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v4)
  {
    v41 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "midiChannel");
        if (v7 < 0x10 || v7 == 127)
        {
          v42.__r_.__value_.__s.__data_[0] = v7;
          v52 = 0;
          objc_msgSend(v6, "enabledProfiles");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "count");

          v52 = v9;
          v51 = 0;
          objc_msgSend(v6, "disabledProfiles");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          v51 = v11;
          objc_msgSend(v3, "appendBytes:length:", &v42, 1);
          objc_msgSend(v3, "appendBytes:length:", &v52, 1);
          v50 = 0u;
          v48 = 0u;
          v49 = 0u;
          v47 = 0u;
          objc_msgSend(v6, "enabledProfiles");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v48 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * j);
                BYTE4(v57) = 0;
                LODWORD(v57) = 0;
                objc_msgSend(v16, "profileID");
                v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v18 = objc_msgSend(v17, "bytes");
                v19 = *(_DWORD *)v18;
                BYTE4(v57) = *(_BYTE *)(v18 + 4);
                LODWORD(v57) = v19;

                objc_msgSend(v3, "appendBytes:length:", &v57, 5);
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
            }
            while (v13);
          }

          objc_msgSend(v3, "appendBytes:length:", &v51, 1);
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v6, "disabledProfiles");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v44 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * k);
                BYTE4(v57) = 0;
                LODWORD(v57) = 0;
                objc_msgSend(v24, "profileID");
                v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v26 = objc_msgSend(v25, "bytes");
                v27 = *(_DWORD *)v26;
                BYTE4(v57) = *(_BYTE *)(v26 + 4);
                LODWORD(v57) = v27;

                objc_msgSend(v3, "appendBytes:length:", &v57, 5);
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
            }
            while (v21);
          }

        }
        else
        {
          NSLog(CFSTR("registerProfiles: \n Failed to register profiles on channel %d (Channel is out of range)"), objc_msgSend(v6, "midiChannel"));
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v4);
  }

  v28 = objc_retainAutorelease(v3);
  v29 = objc_msgSend(v28, "bytes");
  v30 = objc_msgSend(v28, "length");
  memset(&v42, 0, sizeof(v42));
  __s = 0;
  v59 = 0;
  v60 = 0;
  v31 = funopen(&v57, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
  v57 = v31;
  if (v30 >= 1)
  {
    do
    {
      if (v30 >= 16)
        v32 = 16;
      else
        v32 = v30;
      fprintf(v31, "%08lX:  ", v29);
      for (m = 0; m != 16; ++m)
      {
        if (m >= v32)
          fwrite("   ", 3uLL, 1uLL, v31);
        else
          fprintf(v31, "%02X ", *(unsigned __int8 *)(v29 + m));
      }
      for (n = 0; n != 16; ++n)
      {
        if (n >= v32)
        {
          v35 = 32;
        }
        else if (*(unsigned __int8 *)(v29 + n) - 32 >= 0x5F)
        {
          v35 = 46;
        }
        else
        {
          v35 = *(unsigned __int8 *)(v29 + n);
        }
        fputc(v35, v31);
      }
      fputc(10, v31);
      v29 += 16;
      v36 = v30 <= 16;
      v30 -= 16;
    }
    while (!v36);
    v31 = v57;
  }
  fflush(v31);
  v37 = __s;
  if (!__s)
  {
    v37 = (std::string::value_type *)malloc_type_malloc(1uLL, 0xC3C60566uLL);
    __s = v37;
    v60 = 1;
  }
  v37[v59] = 0;
  std::string::__assign_external(&v42, __s);
  fclose(v57);
  free(__s);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v38 = &v42;
  else
    v38 = (std::string *)v42.__r_.__value_.__r.__words[0];
  NSLog(CFSTR("registerProfiles: \n%s"), v38);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);

}

- (id)getInitiators
{
  return 0;
}

- (BOOL)sendProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData
{
  return 0;
}

- (BOOL)notifyProfile:(MIDICIProfile *)aProfile onChannel:(MIDIChannelNumber)channel isEnabled:(BOOL)enabledState
{
  return 0;
}

- (BOOL)notifyProperty:(id)a3 onChannel:(unsigned __int8)a4 forSubscribers:(id)a5
{
  return 0;
}

- (BOOL)start
{
  return 0;
}

- (NSArray)initiators
{
  return self->initiators;
}

- (id)profileDelegate
{
  return self->_profileDelegate;
}

- (MIDICIPropertyResponderDelegate)propertyDelegate
{
  return self->_propertyDelegate;
}

- (void)setPropertyDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDelegate, a3);
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->initiators, 0);
  objc_storeStrong((id *)&self->_profileStates, 0);
  objc_storeStrong((id *)&self->_propertyDelegate, 0);
  objc_storeStrong((id *)&self->_profileDelegate, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

+ (id)description
{
  return CFSTR("MIDI-CI Responder");
}

@end
