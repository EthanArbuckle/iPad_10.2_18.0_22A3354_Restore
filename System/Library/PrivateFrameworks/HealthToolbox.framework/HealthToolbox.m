id WDAsUserActivityResponder(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254DF5510))
  {
    v2 = v1;
  }
  else
  {
    +[WDEmptyUserActivityResponder emptyUserActivityResponder](WDEmptyUserActivityResponder, "emptyUserActivityResponder");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void sub_21581B2B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2_0(uint64_t a1, void *a2)
{
  return a2;
}

void sub_21581D864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_7(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

void sub_215820CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158211DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215822C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215823BD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_215825A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215828A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HKElectrocardiogramOverviewAvailabilityState(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "isOnboardingRecordPresent"))
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD2C98]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "areAllRequirementsSatisfied");

    if ((v3 & 1) != 0)
    {
      v4 = 3;
    }
    else
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "areAllRequirementsSatisfied");

      v4 = 0;
    }
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD2C50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "areAllRequirementsSatisfied") & 1) != 0
      || (objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2D08]) & 1) == 0)
    {

      v4 = 1;
    }
    else
    {
      v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x24BDD2DA0]);

      if (v6)
        v4 = 2;
      else
        v4 = 1;
    }
  }

  return v4;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_21582CBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21582F57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158302BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_215831A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_215832104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_215832474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t getCategoryOfType(void *a1)
{
  unint64_t v1;
  uint64_t result;
  unint64_t v3;

  v1 = objc_msgSend(a1, "code");
  result = 1;
  if (v1 > 0x3E)
    goto LABEL_5;
  if (((1 << v1) & 0x600000000003402DLL) != 0)
    return 0;
  if (((1 << v1) & 0xC8000) == 0)
  {
LABEL_5:
    v3 = v1 - 71;
    if (v3 > 0x10 || ((1 << v3) & 0x10007) == 0)
      return 2;
  }
  return result;
}

const __CFString *stringForCategoryValue(uint64_t a1, unint64_t a2)
{
  const __CFString *result;
  __CFString **v4;
  const __CFString *v5;
  BOOL v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString **v9;
  const __CFString *v10;

  result = 0;
  if (a1 > 139)
  {
    switch(a1)
    {
      case 140:
      case 147:
      case 156:
      case 189:
      case 191:
      case 192:
      case 200:
      case 237:
      case 254:
      case 262:
      case 263:
      case 264:
      case 265:
      case 276:
      case 293:
        goto LABEL_8;
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 190:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 208:
      case 209:
      case 210:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 227:
      case 228:
      case 238:
      case 239:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 251:
      case 252:
      case 253:
      case 255:
      case 256:
      case 257:
      case 258:
      case 259:
      case 260:
      case 261:
      case 266:
      case 267:
      case 268:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
        return result;
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 165:
      case 166:
      case 167:
      case 168:
      case 171:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 211:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
        if (a2 >= 5)
          goto LABEL_49;
        v4 = off_24D38D760;
        goto LABEL_5;
      case 164:
      case 169:
        v10 = CFSTR("HKCategoryValuePresencePresent");
        if (a2)
          v10 = 0;
        if (a2 == 1)
          return CFSTR("HKCategoryValuePresenceNotPresent");
        else
          return v10;
      case 170:
        if (a2 >= 4)
          goto LABEL_49;
        v4 = off_24D38D788;
        goto LABEL_5;
      case 178:
        v5 = CFSTR("HKCategoryValueEnvironmentalAudioExposureEventMomentaryLimit");
        goto LABEL_39;
      case 193:
        v8 = a2 - 1;
        if (a2 - 1 >= 7)
          goto LABEL_49;
        v9 = off_24D38D818;
        goto LABEL_46;
      case 199:
        v5 = CFSTR("HKCategoryValueHeadphoneAudioExposureEventSevenDayLimit");
        goto LABEL_39;
      case 236:
        v5 = CFSTR("HKCategoryValueLowCardioFitnessEventLowFitness");
LABEL_39:
        v6 = a2 == 1;
        goto LABEL_9;
      case 243:
        v8 = a2 - 1;
        if (a2 - 1 >= 3)
          goto LABEL_49;
        v9 = off_24D38D870;
        goto LABEL_46;
      case 244:
        v8 = a2 - 1;
        if (a2 - 1 >= 3)
          goto LABEL_49;
        v9 = off_24D38D888;
        goto LABEL_46;
      case 250:
        v8 = a2 - 1;
        if (a2 - 1 >= 4)
          goto LABEL_49;
        v9 = off_24D38D7A8;
        goto LABEL_46;
      default:
        if ((unint64_t)(a1 - 313) < 2)
          goto LABEL_21;
        return result;
    }
  }
  switch(a1)
  {
    case '[':
      v8 = a2 - 1;
      if (a2 - 1 >= 5)
        goto LABEL_49;
      v9 = off_24D38D7F0;
      goto LABEL_46;
    case '\\':
      v8 = a2 - 1;
      if (a2 - 1 >= 4)
        goto LABEL_49;
      v9 = off_24D38D850;
      goto LABEL_46;
    case ']':
    case '^':
    case 'b':
      return result;
    case '_':
LABEL_21:
      v8 = a2 - 1;
      if (a2 - 1 >= 5)
        goto LABEL_49;
      v9 = off_24D38D7C8;
LABEL_46:
      result = v9[v8];
      break;
    case 'a':
    case 'c':
LABEL_8:
      v5 = CFSTR("HKCategoryValueNotApplicable");
      v6 = a2 == 0;
LABEL_9:
      if (v6)
        return v5;
      else
        return 0;
    default:
      if (a1 == 63)
      {
        if (a2 >= 6)
        {
LABEL_49:
          result = 0;
        }
        else
        {
          v4 = off_24D38D8A0;
LABEL_5:
          result = v4[a2];
        }
      }
      else
      {
        v7 = CFSTR("HKCategoryValueAppleStandHourStood");
        if (a2)
          v7 = 0;
        if (a2 == 1)
          v7 = CFSTR("HKCategoryValueAppleStandHourIdle");
        if (a1 == 70)
          result = v7;
        else
          result = 0;
      }
      break;
  }
  return result;
}

void sub_2158361B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21583E234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215842390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215844B24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_215844FB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_215845E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215845FA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_215846620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215848338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215848840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21584AA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WDBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)WDBundle___ClassBundle;
  if (!WDBundle___ClassBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)WDBundle___ClassBundle;
    WDBundle___ClassBundle = v1;

    v0 = (void *)WDBundle___ClassBundle;
  }
  return v0;
}

uint64_t WDIndexForTab(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 1;
  else
    return qword_215877820[a1 - 1];
}

double WDFloorRectToViewScale(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  UIFloorToViewScale();
  v3 = v2;
  UIFloorToViewScale();
  UIFloorToViewScale();
  UIFloorToViewScale();

  return v3;
}

id WDPredicateMatchingPredicates(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    v6 = (void *)MEMORY[0x24BDD14C0];
    v11[0] = v3;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3)
      v9 = v3;
    else
      v9 = v4;
    v8 = v9;
  }

  return v8;
}

uint64_t WDIsRunningDemoMode()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "BOOLForKey:", CFSTR("UseDemoData")) & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode");

  return v1;
}

const __CFString *WDGetDemoDataResourceName()
{
  return CFSTR("demodata");
}

id WDGetProfileNameForHealthStore(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v1 = a1;
  objc_msgSend(v1, "profileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3E40]), "initWithHealthStore:", v1);
    v5 = dispatch_semaphore_create(0);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __WDGetProfileNameForHealthStore_block_invoke;
    v10[3] = &unk_24D38DF38;
    v12 = &v13;
    v6 = v5;
    v11 = v6;
    objc_msgSend(v4, "fetchDisplayName:", v10);
    v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_21584C624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21584D5EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21584FDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158522B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215853254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOSUtilitiesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSOSUtilitiesClass_softClass;
  v7 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOSUtilitiesClass_block_invoke;
    v3[3] = &unk_24D38E168;
    v3[4] = &v4;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2158535DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOSManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSOSManagerClass_softClass;
  v7 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOSManagerClass_block_invoke;
    v3[3] = &unk_24D38E168;
    v3[4] = &v4;
    __getSOSManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_215853694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215853D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getSOSContactsManagerClass_block_invoke(uint64_t a1)
{
  SOSLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOSContactsManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOSContactsManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOSContactsManagerClass_block_invoke_cold_1();
    SOSLibrary();
  }
}

void SOSLibrary()
{
  void *v0;

  if (!SOSLibraryCore_frameworkLibrary)
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSOSUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SOSLibrary();
  result = objc_getClass("SOSUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOSUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOSUtilitiesClass_block_invoke_cold_1();
    return (Class)__getSOSManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getSOSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  WDAppleWalkingSteadinessListDataProvider *v3;
  SEL v4;
  id v5;

  SOSLibrary();
  result = objc_getClass("SOSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (WDAppleWalkingSteadinessListDataProvider *)__getSOSManagerClass_block_invoke_cold_1();
    return (Class)-[WDAppleWalkingSteadinessListDataProvider textForObject:](v3, v4, v5);
  }
  return result;
}

void sub_215855F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2158567F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_215856DBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_215857C78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_215858F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21585B690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21585C974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return objc_opt_class();
}

void sub_2158602A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_215862804(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21586293C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_215863B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215865C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215865E28(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2158661BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_215866FB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21586A3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21586A6FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21586A938(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21586B348(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t __getSOSContactsManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOSUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getSOSUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSOSManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __50__WDDataListViewController__deleteAllWithOptions___block_invoke_cold_1(v0);
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x24BE08CC0]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x24BE378E0]();
}

uint64_t HKAFibBurdenClampedLowerBoundLocalizedString()
{
  return MEMORY[0x24BE49FD8]();
}

uint64_t HKAuthorizationStatusAllowsReading()
{
  return MEMORY[0x24BDD2828]();
}

uint64_t HKAuthorizationStatusAllowsSharing()
{
  return MEMORY[0x24BDD2830]();
}

uint64_t HKBluetoothIcon()
{
  return MEMORY[0x24BE49FE8]();
}

uint64_t HKCalendarDateTransformNone()
{
  return MEMORY[0x24BDD2838]();
}

uint64_t HKConditionallyRedactedHeartRhythmString()
{
  return MEMORY[0x24BDD2AF0]();
}

uint64_t HKConnectedGymSourceName()
{
  return MEMORY[0x24BDD2AF8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x24BDD2B28]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x24BE4A000]();
}

uint64_t HKDeviceImage()
{
  return MEMORY[0x24BE4A010]();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return MEMORY[0x24BDD2BB8]();
}

uint64_t HKErrorTableViewCell()
{
  return MEMORY[0x24BE4A048]();
}

uint64_t HKFormattedStringForDate()
{
  return MEMORY[0x24BE4A068]();
}

uint64_t HKFormattedStringFromValue()
{
  return MEMORY[0x24BE4A070]();
}

uint64_t HKFormattedStringFromValueForContext()
{
  return MEMORY[0x24BE4A078]();
}

uint64_t HKFormatterIncludesUnitForDisplayTypeInContext()
{
  return MEMORY[0x24BE4A080]();
}

uint64_t HKHealthKeyColor()
{
  return MEMORY[0x24BE4A090]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x24BDD2F18]();
}

uint64_t HKHealthRecordsAPILocalizedStringWithSource()
{
  return MEMORY[0x24BE4A098]();
}

uint64_t HKHealthTintColor()
{
  return MEMORY[0x24BE4A0B0]();
}

uint64_t HKHealthUIBuddyDirectionalEdgeInsets()
{
  return MEMORY[0x24BE4A0B8]();
}

uint64_t HKHealthUIFrameworkBundle()
{
  return MEMORY[0x24BE4A0C0]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x24BE4A0D0]();
}

uint64_t HKInternalAuthorizationStatusMake()
{
  return MEMORY[0x24BDD2F50]();
}

uint64_t HKLocalizedNoDataString()
{
  return MEMORY[0x24BE4A0D8]();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return MEMORY[0x24BE4A0E0]();
}

uint64_t HKLocalizedStringForNumberWithTemplate()
{
  return MEMORY[0x24BE4A0F0]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x24BDD32F0]();
}

uint64_t HKPriorYearsDateFormatterNoTime()
{
  return MEMORY[0x24BE4A110]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x24BDD3708]();
}

uint64_t HKSleepStartDateForDate()
{
  return MEMORY[0x24BE4A118]();
}

uint64_t HKTimeFormatter()
{
  return MEMORY[0x24BE4A148]();
}

uint64_t HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory()
{
  return MEMORY[0x24BE4A168]();
}

uint64_t HKUIApplicationIsUsingAccessibilityContentSizeCategory()
{
  return MEMORY[0x24BE4A170]();
}

uint64_t HKUIBloodPressureSystolicDiastolicSeparatorString()
{
  return MEMORY[0x24BE4A180]();
}

uint64_t HKUIJoinAttributedStringsForLocale()
{
  return MEMORY[0x24BE4A1B8]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x24BE4A1C8]();
}

uint64_t HKUIJoinStringsForLocale()
{
  return MEMORY[0x24BE4A1D0]();
}

uint64_t HKUILocalizedStringForGAD7Risk()
{
  return MEMORY[0x24BE4A1E8]();
}

uint64_t HKUILocalizedStringForPHQ9Risk()
{
  return MEMORY[0x24BE4A1F0]();
}

uint64_t HKUILocalizedStringForValenceClassification()
{
  return MEMORY[0x24BE4A210]();
}

uint64_t HKUIObjectIsLarger()
{
  return MEMORY[0x24BE4A220]();
}

uint64_t HKUIObjectIsLargerOrEqual()
{
  return MEMORY[0x24BE4A228]();
}

uint64_t HKUIObjectIsSmaller()
{
  return MEMORY[0x24BE4A230]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x24BE4A238]();
}

uint64_t HKUIPredicateMatchingPredicates()
{
  return MEMORY[0x24BE4A240]();
}

uint64_t HKUnitPreferenceControllerAvailableUnitsForDisplayType()
{
  return MEMORY[0x24BE4A260]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x24BDD38A8]();
}

uint64_t NSStringFromHKFeatureAvailabilityRescindedStatus()
{
  return MEMORY[0x24BDD38B0]();
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x24BDF7720]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKMetadataKeyIsPrivate()
{
  return MEMORY[0x24BDD4358]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x24BDD44F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
  MEMORY[0x24BEDE7B0](writer);
}

xmlTextWriterPtr xmlNewTextWriterFilename(const char *uri, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x24BEDEA08](uri, *(_QWORD *)&compression);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED38](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED40](writer);
}

int xmlTextWriterEndPI(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED48](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x24BEDED60](writer, *(_QWORD *)&indent);
}

int xmlTextWriterSetIndentString(xmlTextWriterPtr writer, const xmlChar *str)
{
  return MEMORY[0x24BEDED68](writer, str);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x24BEDED88](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x24BEDED90](writer, name);
}

int xmlTextWriterStartPI(xmlTextWriterPtr writer, const xmlChar *target)
{
  return MEMORY[0x24BEDEDA0](writer, target);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x24BEDEDA8](writer, name, content);
}

int xmlTextWriterWriteAttributeNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI, const xmlChar *content)
{
  return MEMORY[0x24BEDEDB0](writer, prefix, name, namespaceURI, content);
}

int xmlTextWriterWriteDTD(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *pubid, const xmlChar *sysid, const xmlChar *subset)
{
  return MEMORY[0x24BEDEDC8](writer, name, pubid, sysid, subset);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDD8](writer, content);
}

