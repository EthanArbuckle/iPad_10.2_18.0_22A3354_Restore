uint64_t sub_20D65269C()
{
  return 3;
}

BOOL sub_20D6526A4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = objc_msgSend_length(a1, a2, a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)objc_opt_class();
  v9 = objc_msgSend_im_maxBigmojiCount(v6, v7, v8);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x24BDD14A8], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20D6527C0;
  v17[3] = &unk_24C751090;
  v13 = v12;
  v18 = v13;
  v19 = &v21;
  v20 = v9;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(a1, v14, 0, v5, 2, v17);
  v15 = v22[3] - 1 < v9;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void sub_20D6527A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D6527C0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  objc_msgSend_stringByTrimmingCharactersInSet_(a2, (const char *)a2, a1[4]);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_length(v15, v9, v10);
  v12 = v15;
  if (v11)
  {
    if (CEMStringIsSingleEmoji())
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v12 = v15;
    }
    else
    {
      v14 = 0;
      v12 = v15;
      do
      {
        if (objc_msgSend_characterAtIndex_(v12, v13, v14) != 65532)
        {
          *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
          *a7 = 1;
        }
        ++v14;
        v12 = v15;
      }
      while (v11 != v14);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > (unint64_t)a1[6])
      *a7 = 1;
  }

}

uint64_t sub_20D654C40(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend__updateBubbleOpacity(*(void **)(a1 + 32), a2, a3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_20D65540C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _IMDispatchQueueBlockCompare(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a1, sel_compare_, a2);
}

void sub_20D655B90(uint64_t a1)
{
  _IMDispatchQueueBlock *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char *value;

  v2 = [_IMDispatchQueueBlock alloc];
  v4 = (const char *)objc_msgSend_initWithBlock_key_priority_fifo_(v2, v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v5 = *(_QWORD *)(a1 + 32);
  value = (char *)v4;
  if (v5)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 48), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v7, *MEMORY[0x24BDBCAB8], CFSTR("Tried to add block for key %@ which IMDispatchQueue already contains."), *(_QWORD *)(a1 + 32));
    objc_msgSend_setObject_forKey_(*(void **)(a1 + 48), v7, (uint64_t)value, *(_QWORD *)(a1 + 32));
    v4 = value;
  }
  CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 56), v4);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);

}

void sub_20D655C50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_20D655D48;
  v12 = sub_20D655D70;
  v13 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D655D78;
  block[3] = &unk_24C751130;
  v2 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = &v8;
  dispatch_sync(v2, block);
  v3 = v9[5];
  if (v3)
    (*(void (**)(void))(v3 + 16))();

  _Block_object_dispose(&v8, 8);
}

void sub_20D655D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D655D48(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x212BA6170](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_20D655D70(uint64_t a1)
{

}

void sub_20D655D78(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  CFBinaryHeapGetMinimum(*(CFBinaryHeapRef *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v14 = v2;
    objc_msgSend_key(v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend_removeObjectForKey_(*(void **)(a1 + 40), v5, (uint64_t)v7);
    objc_msgSend_block(v14, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_copy(v8, v9, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    CFBinaryHeapRemoveMinimumValue(*(CFBinaryHeapRef *)(a1 + 32));
    v2 = v14;
  }

}

void sub_20D655F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D655F54(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_block(v11, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_copy(v5, v6, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void sub_20D6560AC(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id v6;

  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend_priority(v3, v4, v5);
    v3 = v6;
  }

}

uint64_t sub_20D6561E8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D6561F8(uint64_t a1)
{

}

void sub_20D656200(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend_allKeys(*(void **)(a1 + 32), a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_copy(v9, v4, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_20D656340(uint64_t a1, const char *a2)
{
  void *v3;

  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;

}

void sub_20D65643C(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  id v6;

  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v6, v3, v4);
  objc_msgSend_removeObjectForKey_(*(void **)(a1 + 32), v5, *(_QWORD *)(a1 + 40));

}

uint64_t sub_20D656544(uint64_t a1)
{
  const char *v2;
  uint64_t v3;

  CFBinaryHeapRemoveAllValues(*(CFBinaryHeapRef *)(a1 + 32));
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(*(void **)(a1 + 40), v2, (uint64_t)&unk_24C750F68);
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 40), sel_removeAllObjects, v3);
}

uint64_t sub_20D65657C(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_cancel(a3, a2, (uint64_t)a3);
}

uint64_t sub_20D656DB0(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  return MEMORY[0x24BEDD108](v1, sel_CGImage, v2);
}

void sub_20D657468(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 136));
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_20D6574F0(uint64_t a1)
{
  void *v2;
  double v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 64);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = sub_20D6575C8;
  v9 = &unk_24C7511F0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend_playAfterDelay_completion_(v2, v4, (uint64_t)&v6, v3);
  objc_msgSend_setPlaying_(*(void **)(a1 + 40), v5, 1, v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void sub_20D6575A8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D6575C8(uint64_t a1, int a2)
{
  const char *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
    objc_msgSend_audioPlayerDidFinishPlaying_(WeakRetained, v4, (uint64_t)v5);

}

void sub_20D657620(id *a1)
{
  void (**v2)(_QWORD);
  const char *v3;
  uint64_t v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10[2];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D657724;
  v6[3] = &unk_24C751218;
  v7 = a1[4];
  v10[1] = a1[8];
  objc_copyWeak(&v9, a1 + 6);
  objc_copyWeak(v10, a1 + 7);
  v8 = a1[5];
  v2 = (void (**)(_QWORD))MEMORY[0x212BA6170](v6);
  if ((objc_msgSend_shouldUseSpeaker(a1[5], v3, v4) & 1) != 0)
    v2[2](v2);
  else
    objc_msgSend_playListenSound_(a1[5], v5, (uint64_t)v2);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);

}

void sub_20D657708(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D657724(uint64_t a1)
{
  void *v2;
  double v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int);
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 64);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = sub_20D6577FC;
  v9 = &unk_24C7511F0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend_playAfterDelay_completion_(v2, v4, (uint64_t)&v6, v3);
  objc_msgSend_setPlaying_(*(void **)(a1 + 40), v5, 1, v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void sub_20D6577DC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D6577FC(uint64_t a1, int a2)
{
  const char *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
    objc_msgSend_audioPlayerDidFinishPlaying_(WeakRetained, v4, (uint64_t)v5);

}

void sub_20D657A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D657A44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D657A54(uint64_t a1)
{

}

uint64_t sub_20D657A5C(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t shouldUseAVPlayer;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;

  if ((objc_msgSend_isActive(*(void **)(a1 + 32), a2, a3) & 1) == 0)
    return objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(*(void **)(a1 + 40), v4, *(_QWORD *)(a1 + 48), 0);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    shouldUseAVPlayer = objc_msgSend_shouldUseAVPlayer(*(void **)(a1 + 40), v4, v5);
    objc_msgSend_audioPlayerWithContentsOfURL_shouldUseAVPlayer_(IMAudioPlayer, v9, v7, shouldUseAVPlayer);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend_setDelegate_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13, *(_QWORD *)(a1 + 40));
    objc_msgSend_setAudioPlayer_(*(void **)(a1 + 40), v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  return objc_msgSend_prepareToPlay(v6, v4, v5);
}

uint64_t sub_20D657FA4(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_stop(*(void **)(a1 + 32), a2, a3);
}

void sub_20D65815C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D658178(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_setListenAudioPlayer_(WeakRetained, (const char *)WeakRetained, 0);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

uint64_t sub_20D6587B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__handleAVPlayerItemStateChange, a3);
}

void *sub_20D658A88()
{
  void *result;

  result = (void *)MEMORY[0x212BA5EF4]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  off_2549C1238 = result;
  return result;
}

void *sub_20D658C04()
{
  void *result;

  result = (void *)MEMORY[0x212BA5EF4]("CMTimeCompare", CFSTR("CoreMedia"));
  off_2549C1248 = result;
  return result;
}

void *sub_20D658C30()
{
  void *result;

  result = (void *)MEMORY[0x212BA5EF4]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  off_2549C1258 = result;
  return result;
}

uint64_t sub_20D658E18(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t isEqualToString;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 3;
  objc_msgSend_name(*(void **)(a1 + 40), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x24BDB1FA8]);

  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__notifyPlayerDidFinishSuccessfully_, isEqualToString);
}

void sub_20D65A1E4(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  id v10;

  v4 = *(id **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4 + 2);
  objc_msgSend_layoutEngine_transcriptItemAtIndex_(WeakRetained, v6, *(_QWORD *)(a1 + 32), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__makeDrawableForTranscriptItem_(v4, v8, (uint64_t)v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(*(void **)(a1 + 40), v9, (uint64_t)v10);
}

BOOL IMBalloonDescriptorEqualsBalloonDescriptor(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1)
      && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2)
      && a1[24] == a2[24]
      && a1[25] == a2[25];
}

const __CFString *NSStringFromIMBalloonVisibleOrientation(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("IMBalloonVisibleOrientationRight");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("IMBalloonVisibleOrientationLeft");
}

__CFString *NSStringFromIMTranscriptOrientation(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24C751318[a1];
}

__CFString *NSStringFromIMBalloonShape(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24C751330[a1];
}

__CFString *NSStringFromIMTailShape(unsigned int a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24C751348[a1];
}

const __CFString *NSStringFromIMBalloonStyle(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("IMBalloonStyleStroked");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("IMBalloonStyleFilled");
}

id NSStringFromIMRectCorner(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  objc_msgSend_string(MEMORY[0x24BDD16A8], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (a1 == -1)
  {
    if (objc_msgSend_length(v4, v5, v6))
      objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("|%@"), CFSTR("IMRectCornerAllCorners"));
    else
      objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("IMRectCornerAllCorners"));
  }

  v9 = v7;
  v12 = v9;
  if ((a1 & 1) != 0)
  {
    if (objc_msgSend_length(v9, v10, v11))
      objc_msgSend_appendFormat_(v12, v13, (uint64_t)CFSTR("|%@"), CFSTR("IMRectCornerTopLeft"));
    else
      objc_msgSend_appendString_(v12, v13, (uint64_t)CFSTR("IMRectCornerTopLeft"));
  }

  v14 = v12;
  v17 = v14;
  if ((a1 & 2) != 0)
  {
    if (objc_msgSend_length(v14, v15, v16))
      objc_msgSend_appendFormat_(v17, v18, (uint64_t)CFSTR("|%@"), CFSTR("IMRectCornerTopRight"));
    else
      objc_msgSend_appendString_(v17, v18, (uint64_t)CFSTR("IMRectCornerTopRight"));
  }

  v19 = v17;
  v22 = v19;
  if ((a1 & 4) != 0)
  {
    if (objc_msgSend_length(v19, v20, v21))
      objc_msgSend_appendFormat_(v22, v23, (uint64_t)CFSTR("|%@"), CFSTR("IMRectCornerBottomLeft"));
    else
      objc_msgSend_appendString_(v22, v23, (uint64_t)CFSTR("IMRectCornerBottomLeft"));
  }

  v24 = v22;
  v27 = v24;
  if ((a1 & 8) != 0)
  {
    if (objc_msgSend_length(v24, v25, v26))
      objc_msgSend_appendFormat_(v27, v28, (uint64_t)CFSTR("|%@"), CFSTR("IMRectCornerBottomRight"));
    else
      objc_msgSend_appendString_(v27, v28, (uint64_t)CFSTR("IMRectCornerBottomRight"));
  }

  return v27;
}

id NSStringFromIMBalloonAttributes(int a1, const char *a2, uint64_t a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;

  objc_msgSend_string(MEMORY[0x24BDD16A8], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (!a1)
  {
    if (objc_msgSend_length(v4, v5, v6))
      objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("|%@"), CFSTR("IMBalloonAttributeNone"));
    else
      objc_msgSend_appendString_(v7, v8, (uint64_t)CFSTR("IMBalloonAttributeNone"));
  }

  v9 = v7;
  v12 = v9;
  if (a1 && (a1 & 2) != 0)
  {
    if (objc_msgSend_length(v9, v10, v11))
      objc_msgSend_appendFormat_(v12, v13, (uint64_t)CFSTR("|%@"), CFSTR("IMBalloonAttributeIsOpaque"));
    else
      objc_msgSend_appendString_(v12, v13, (uint64_t)CFSTR("IMBalloonAttributeIsOpaque"));
  }

  v14 = v12;
  v17 = v14;
  if (a1 && (a1 & 4) != 0)
  {
    if (objc_msgSend_length(v14, v15, v16))
      objc_msgSend_appendFormat_(v17, v18, (uint64_t)CFSTR("|%@"), CFSTR("IMBalloonAttributeUseLargeAsset"));
    else
      objc_msgSend_appendString_(v17, v18, (uint64_t)CFSTR("IMBalloonAttributeUseLargeAsset"));
  }

  return v17;
}

id NSStringFromIMBalloonDescriptor(char *a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *a1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_24C751330[v3];
  v5 = a1[1];
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_24C751348[v5];
  if (a1[1])
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = CFSTR("IMBalloonStyleStroked");
  if (a1[2] != 1)
    v8 = 0;
  if (a1[2])
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR("IMBalloonStyleFilled");
  v10 = *((_QWORD *)a1 + 1);
  v11 = CFSTR("IMBalloonVisibleOrientationRight");
  if (v10 != 1)
    v11 = 0;
  if (v10)
    v12 = (__CFString *)v11;
  else
    v12 = CFSTR("IMBalloonVisibleOrientationLeft");
  v13 = a1[24];
  v14 = v12;
  v15 = v9;
  NSStringFromIMColorType(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromIMRectCorner(*((_QWORD *)a1 + 2), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromIMBalloonAttributes(a1[25], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v23, (uint64_t)CFSTR("IMBalloonDescriptor_t = Shape:%@, TailShape:%@ (HasTail:%@), BalloonStyle:%@, BalloonOrientation:%@, BalloonColor:%@, BalloonCorners:%@, BalloonAttributes:%@"), v4, v6, v7, v15, v14, v16, v19, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t sub_20D65AAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD1968], sel_value_withObjCType_, a3);
}

uint64_t sub_20D65AAE4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  return MEMORY[0x24BEDD108](a1, sel_getValue_size_, a2);
}

id IMSharedUIBundle()
{
  if (qword_2549C1270 != -1)
    dispatch_once(&qword_2549C1270, &unk_24C750FA8);
  return (id)qword_2549C1268;
}

void sub_20D65AB38(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a2, (uint64_t)CFSTR("com.apple.messages.IMSharedUI"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_2549C1268;
  qword_2549C1268 = v2;

}

uint64_t IMAnonymizeContentAndContacts()
{
  return byte_2549C1278;
}

void IMSetAnonymizeContentAndContacts(int a1)
{
  if (byte_2549C1278 != a1)
  {
    byte_2549C1278 = a1;
    dispatch_async(MEMORY[0x24BDAC9B8], &unk_24C751370);
  }
}

void sub_20D65ABA4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v4, v3, (uint64_t)CFSTR("IMAnonymizeContentAndContactsDidChangeNotification"), 0);

}

id IMURLForResourceFromSharedUIBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  IMSharedUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v5, v6, (uint64_t)v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_20D65AC88()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE50E78], "IMSharedUI.transcript");
  v1 = (void *)qword_2549C1280;
  qword_2549C1280 = (uint64_t)v0;

}

void sub_20D65ACFC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE50E78], "IMSharedUI.fsm");
  v1 = (void *)qword_2549C1290;
  qword_2549C1290 = (uint64_t)v0;

}

void sub_20D65AD70()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE50E78], "IMSharedUI.audio");
  v1 = (void *)qword_2549C12A0;
  qword_2549C12A0 = (uint64_t)v0;

}

void sub_20D65ADE4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE50E78], "IMSharedUI.utilities");
  v1 = (void *)qword_2549C12B0;
  qword_2549C12B0 = (uint64_t)v0;

}

id sub_20D65AE40(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t *v3;

  if (objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3) == 2)
  {
    if (qword_2549C12C8 != -1)
      dispatch_once(&qword_2549C12C8, &unk_24C751430);
    v3 = &qword_2549C12C0;
  }
  else
  {
    if (qword_2549C12D8 != -1)
      dispatch_once(&qword_2549C12D8, &unk_24C751450);
    v3 = &qword_2549C12D0;
  }
  return (id)*v3;
}

void sub_20D65AEC8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], a2, a3, 0.149019608, 0.149019608, 0.160784314, 1.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2549C12C0;
  qword_2549C12C0 = v3;

}

void sub_20D65AF0C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], a2, a3, 0.898039216, 0.898039216, 0.917647059, 1.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2549C12D0;
  qword_2549C12D0 = v3;

}

id sub_20D65B064(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  if ((unint64_t)v3 < 2)
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v4, v5, 0.894117647, 0.894117647, 0.901960784, 1.0);
LABEL_5:
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3 == (void *)2)
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v4, v5, 0.168627451, 0.168627451, 0.180392157, 1.0);
    goto LABEL_5;
  }
  return v3;
}

id sub_20D65B0E0(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend_userInterfaceStyle(a2, (const char *)a2, a3);
  if ((unint64_t)v3 < 2)
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v4, v5, 0.498039216, 0.498039216, 0.517647059, 1.0);
LABEL_5:
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (v3 == (void *)2)
  {
    objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v4, v5, 0.619607843, 0.619607843, 0.619607843, 1.0);
    goto LABEL_5;
  }
  return v3;
}

uint64_t sub_20D65B14C(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v6 = a3;
  v7 = (void *)qword_2549C12E0;
  if (!qword_2549C12E0)
  {
    objc_msgSend_autoupdatingCurrentCalendar(MEMORY[0x24BDBCE48], v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_2549C12E0;
    qword_2549C12E0 = v8;

    v7 = (void *)qword_2549C12E0;
  }
  objc_msgSend_components_fromDate_(v7, v4, 28, a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_components_fromDate_((void *)qword_2549C12E0, v11, 28, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_isEqual_(v10, v13, (uint64_t)v12) ^ 1;

  return v14;
}

id sub_20D65B1F0(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  if (qword_2549C12E8 != -1)
    dispatch_once(&qword_2549C12E8, &unk_24C750FE8);
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_((void *)qword_2549C12F0, v6, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend__im_createDateFormatterForTimestampFormat_(a1, v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2549C12F0, v9, (uint64_t)v8, v5);
  }
  objc_msgSend_stringFromDate_(v8, v7, (uint64_t)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_20D65B2C0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_2549C12F0;
  qword_2549C12F0 = v3;

}

id sub_20D65B2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;

  switch(a3)
  {
    case 0:
      v3 = 1;
      goto LABEL_6;
    case 1:
      v4 = 0;
      v5 = 0;
      v3 = 1;
      break;
    case 2:
      v3 = 0;
LABEL_6:
      v4 = 1;
      v5 = 1;
      break;
    case 3:
      v5 = 1;
      v3 = 2;
      v4 = 1;
      break;
    default:
      v3 = 0;
      v4 = 0;
      v5 = 0;
      break;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_setDoesRelativeDateFormatting_(v6, v7, v4);
  objc_msgSend_setDateStyle_(v6, v8, v5);
  objc_msgSend_setTimeStyle_(v6, v9, v3);
  return v6;
}

id IMAttachmentLogSubtype()
{
  if (qword_2549C1300 != -1)
    dispatch_once(&qword_2549C1300, &unk_24C751008);
  return (id)qword_2549C12F8;
}

void sub_20D65B3E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.messages", "IMAttachment");
  v1 = (void *)qword_2549C12F8;
  qword_2549C12F8 = (uint64_t)v0;

}

uint64_t sub_20D65B414(void *a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  char isEqualToData;
  uint64_t v21;
  NSObject *v22;
  int v24;
  _QWORD v25[4];
  NSObject *v26;

  v2 = dispatch_semaphore_create(0);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_20D65B5B0;
  v25[3] = &unk_24C751268;
  v3 = v2;
  v26 = v3;
  objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(a1, v4, (uint64_t)&unk_24C755A10, v25);
  dispatch_semaphore_wait(v3, 0x3B9ACA00uLL);
  v5 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend_metadataForFormat_(a1, v6, *MEMORY[0x24BDB1DB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataItemsFromArray_withKey_keySpace_(v5, v8, (uint64_t)v7, CFSTR("LOOP"), *MEMORY[0x24BDB1E50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v9, v10, v11))
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v24 = 0;
  objc_msgSend_objectAtIndexedSubscript_(v9, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataValue(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v17, (uint64_t)&v24, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToData = objc_msgSend_isEqualToData_(v16, v19, (uint64_t)v18);

  if ((isEqualToData & 1) == 0)
  {
    IMAttachmentLogSubtype();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_20D65DAA4(v22);

    goto LABEL_7;
  }
  v21 = 1;
LABEL_8:

  return v21;
}

intptr_t sub_20D65B5B0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFString *NSStringFromIMColorType(int a1)
{
  uint64_t v1;

  v1 = a1 + 2;
  if (v1 > 8)
    return 0;
  else
    return off_24C7514B0[v1];
}

void sub_20D65BFF0()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)qword_2549C1308;
  qword_2549C1308 = (uint64_t)v0;

}

void sub_20D65C4D8(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (!qword_2549C1318)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend__createSingleton__im(v4, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___setSingleton__im_(v4, v6, (uint64_t)v5);

  }
  objc_sync_exit(obj);

}

void sub_20D65C548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D65C59C()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("IMAudioSessionControllerQueue", 0);
  v1 = (void *)qword_2549C1328;
  qword_2549C1328 = (uint64_t)v0;

}

void sub_20D65C7A0(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  const char *v15;
  const char *v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_audio(IMSharedUILogs, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(unsigned __int8 *)(a1 + 57);
    v7 = (void *)MEMORY[0x212BA6170](*(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 67109632;
    v20 = v5;
    v21 = 1024;
    v22 = v6;
    v23 = 2048;
    v24 = v7;
    _os_log_impl(&dword_20D651000, v4, OS_LOG_TYPE_INFO, "dispatching setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);

  }
  v8 = *(unsigned __int8 *)(a1 + 56);
  if (v8 != objc_msgSend_isActive(*(void **)(a1 + 32), v9, v10)
    || *(_BYTE *)(a1 + 56) && (v13 = *(_QWORD *)(a1 + 48), v13 != objc_msgSend_options(*(void **)(a1 + 32), v11, v12))
    || objc_msgSend_isDirty(*(void **)(a1 + 32), v11, v12))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend_configureAudioSessionWithOptions_(*(void **)(a1 + 32), v11, *(_QWORD *)(a1 + 48));
      v14 = *(_BYTE *)(a1 + 56) != 0;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend_setActive_(*(void **)(a1 + 32), v11, v14);
    objc_msgSend_setOptions_(*(void **)(a1 + 32), v15, *(_QWORD *)(a1 + 48));
    objc_msgSend_setDirty_(*(void **)(a1 + 32), v16, 0);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D65C964;
    block[3] = &unk_24C7510E0;
    v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t sub_20D65C964(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20D65D2E8(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    objc_msgSend_audio(IMSharedUILogs, v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_20D65DD74();

    objc_end_catch();
    JUMPOUT(0x20D65D2A0);
  }
  _Unwind_Resume(exception_object);
}

void sub_20D65D358(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D65DAA4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D651000, log, OS_LOG_TYPE_ERROR, "AVAsset found LOOP metadata with unexpected contents, assuming non-looping", v1, 2u);
}

void sub_20D65DAE4(int a1, void *a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_outputDataSources(a2, (const char *)a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a1;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_20D651000, a3, OS_LOG_TYPE_ERROR, "AudioSessionController: configureAudioSession using speaker = %d, %@", (uint8_t *)v6, 0x12u);

}

void sub_20D65DB94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "AudioSessionController: Failed setting activation context:%@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DBF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "AudioSessionController: Failed setting the category:%@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DC54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "AudioSessionController: Failed setting the mode:%@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DCB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "AudioSessionController: Failed to activate audio session: %@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DD14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "AudioSessionController: Failed to deactivate audio session: %@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DD74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D65D370();
  sub_20D65D358(&dword_20D651000, v0, v1, "Exception deactivating audio session: %@", v2, v3, v4, v5, v6);
  sub_20D65D368();
}

void sub_20D65DDD4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D651000, log, OS_LOG_TYPE_ERROR, "IMAudioPlayer deallocated while playing, completion block won't be called.", v1, 2u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE5600](retstr, t, tx, ty, tz);
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x24BE1B280]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x24BDBB990](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x24BDBB9A8](allocator, capacity, callBacks, compareContext);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x24BDBB9B8](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9C8](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x24BDBB9D0](heap);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IMWarn()
{
  return MEMORY[0x24BE503C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

