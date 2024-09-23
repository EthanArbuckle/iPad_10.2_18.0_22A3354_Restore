@implementation CMSessionMgrSystemSoundActivateForPID

void __CMSessionMgrSystemSoundActivateForPID_block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  int UpdatedSystemSoundPlayFlags;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t *v11;
  uint64_t *v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  MEMORY[0x1940352BC](gCMSS_12);
  if (*(_BYTE *)(a1 + 48))
  {
    if (gSystemSoundIDToCategory)
    {
      v2 = (void *)*(unsigned int *)(a1 + 40);
      v3 = *(_DWORD *)(a1 + 44);
      if (!CMSMUtility_IsSomeClientRecording()
        || !CMSMUtility_IsSomeRecordingSessionPresentThatDisallowsSystemSounds()
        || (UpdatedSystemSoundPlayFlags = cmsmSystemSoundShouldPlayDuringRecording((int)v2)) != 0)
      {
        UpdatedSystemSoundPlayFlags = 0;
        if (gSystemSoundRingerSettings)
        {
          if (gSystemSoundRoutingForCategories && gSystemSoundLowersMusicVolume && gSystemSoundMaxVolume)
            UpdatedSystemSoundPlayFlags = cmsmGetUpdatedSystemSoundPlayFlags(v2, v3, 0, 0, 0, 0, 1, 0, 0);
        }
      }
    }
    else
    {
      UpdatedSystemSoundPlayFlags = 0;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = UpdatedSystemSoundPlayFlags;
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) & 3) != 0
      && !CMSMDeviceState_ScreenIsBlanked())
    {
      v15 = gCMSS_0;
      if (gCMSS_0)
      {
        while (*(_DWORD *)(v15 + 12) != *(_DWORD *)(a1 + 44) || *(_DWORD *)(v15 + 8) != *(_DWORD *)(a1 + 40))
        {
          v15 = *(_QWORD *)v15;
          if (!v15)
            goto LABEL_45;
        }
      }
      else
      {
LABEL_45:
        v16 = malloc_type_calloc(1uLL, 0x18uLL, 0x10200405AF6BDC9uLL);
        v17 = *(unsigned int *)(a1 + 40);
        v16[2] = v17;
        v18 = *(unsigned int *)(a1 + 44);
        v16[3] = v18;
        v19 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        *((_BYTE *)v16 + 16) = v19 & 1;
        v20 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >> 1) & 1;
        *((_BYTE *)v16 + 17) = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) & 2) != 0;
        if ((v19 & 1) != 0)
        {
          cmsmPrewarmAudioForSSID(1, v17, v18);
          *((_BYTE *)v16 + 18) = 1;
          v20 = *((unsigned __int8 *)v16 + 17);
          v17 = v16[2];
          v18 = v16[3];
        }
        if (v20)
        {
          cmsmPrewarmVibeForSSID(1, v17, v18);
          *((_BYTE *)v16 + 19) = 1;
          v17 = v16[2];
          v18 = v16[3];
        }
        *(_QWORD *)v16 = gCMSS_0;
        gCMSS_0 = (uint64_t)v16;
        gCMSS_1 = 1;
        CMSMSleep_CreatePrewarmIdleSleepPreventor(v17, v18);
      }
    }
  }
  else
  {
    v5 = (uint64_t *)gCMSS_0;
    if (gCMSS_0)
    {
      do
      {
        while (1)
        {
          v6 = (uint64_t *)*v5;
          v7 = *((_DWORD *)v5 + 3);
          if (v7 == *(_DWORD *)(a1 + 44))
          {
            v8 = *((unsigned int *)v5 + 2);
            v9 = *(_DWORD *)(a1 + 40);
            if ((_DWORD)v8 == v9 || v9 == 0)
              break;
          }
          v5 = (uint64_t *)*v5;
          if (!v6)
            goto LABEL_37;
        }
        if (*((_BYTE *)v5 + 16) && *((_BYTE *)v5 + 18))
        {
          if ((v8 - 1103) <= 2)
          {
            cmsmRemoveSystemSoundAudioCategoriesThatMixIn(*((unsigned int *)v5 + 3));
            v8 = *((unsigned int *)v5 + 2);
            v7 = *((_DWORD *)v5 + 3);
          }
          cmsmPrewarmAudioForSSID(0, v8, v7);
          *((_BYTE *)v5 + 18) = 0;
        }
        if (*((_BYTE *)v5 + 17) && *((_BYTE *)v5 + 19))
        {
          cmsmPrewarmVibeForSSID(0, *((unsigned int *)v5 + 2), *((_DWORD *)v5 + 3));
          *((_BYTE *)v5 + 19) = 0;
        }
        CMSMSleep_ReleasePrewarmIdleSleepPreventor(*((_DWORD *)v5 + 2), *((_DWORD *)v5 + 3));
        v11 = (uint64_t *)gCMSS_0;
        if ((uint64_t *)gCMSS_0 == v5)
        {
          v12 = &gCMSS_0;
        }
        else
        {
          do
          {
            v12 = v11;
            v11 = (uint64_t *)*v11;
          }
          while (v11 != v5);
        }
        *v12 = *v5;
        free(v5);
        if (*(_DWORD *)(a1 + 40))
          v13 = 1;
        else
          v13 = v6 == 0;
        v5 = v6;
      }
      while (!v13);
LABEL_37:
      v14 = gCMSS_0 != 0;
    }
    else
    {
      v14 = 0;
    }
    gCMSS_1 = v14;
  }
  JUMPOUT(0x1940352C8);
}

@end
