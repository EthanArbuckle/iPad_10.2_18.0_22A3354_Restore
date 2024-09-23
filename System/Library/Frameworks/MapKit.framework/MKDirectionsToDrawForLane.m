@implementation MKDirectionsToDrawForLane

uint64_t ___MKDirectionsToDrawForLane_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v6, "direction");
  v9 = objc_msgSend(v7, "direction");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___MKDirectionsToDrawForLane_block_invoke_2;
  v18[3] = &unk_1E20DA720;
  v10 = v6;
  v19 = v10;
  v20 = *(id *)(a1 + 32);
  v11 = v7;
  v21 = v11;
  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D778DB8](v18);
  if (v8 > 15)
  {
    if (v8 <= 63)
    {
      if (v8 == 16)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0C99E60];
        v15 = &unk_1E2159DD8;
      }
      else
      {
        if (v8 != 32)
          goto LABEL_19;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159DF0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0C99E60];
        v15 = &unk_1E2159E08;
      }
    }
    else
    {
      switch(v8)
      {
        case 64:
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159E20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0C99E60];
          v15 = &unk_1E2159E38;
          break;
        case 128:
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159E50);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0C99E60];
          v15 = &unk_1E2159E68;
          break;
        case 256:
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159F40);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0C99E60];
          v15 = (void *)MEMORY[0x1E0C9AA60];
          break;
        default:
          goto LABEL_19;
      }
    }
LABEL_18:
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = ((uint64_t (**)(_QWORD, uint64_t, void *, void *))v12)[2](v12, v9, v13, v16);

    goto LABEL_19;
  }
  switch(v8)
  {
    case 0:
    case 1:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159E80);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = &unk_1E2159E98;
      goto LABEL_18;
    case 2:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159EB0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = &unk_1E2159EC8;
      goto LABEL_18;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159EE0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = &unk_1E2159EF8;
      goto LABEL_18;
    case 8:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2159F10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = &unk_1E2159F28;
      goto LABEL_18;
    default:
      break;
  }
LABEL_19:

  return v3;
}

uint64_t ___MKDirectionsToDrawForLane_block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = -1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "containsObject:", v13);

    if ((v14 & 1) != 0 || (v15 = a1[5], a1[4] == v15))
    {
      v12 = 1;
    }
    else if (a1[6] == v15)
    {
      v12 = -1;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

@end
