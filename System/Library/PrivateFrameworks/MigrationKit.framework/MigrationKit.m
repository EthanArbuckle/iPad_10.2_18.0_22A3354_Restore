void sub_21EC0D060(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC0D3B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21EC0DB0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC0DE18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC0DF44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC0E5E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21EC0E63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MKUSBDevice;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21EC0E71C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_21EC0E89C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_21EC0E940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21EC0E9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21EC0EBAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t device_interface_state_callback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "interfaceDidChangeState:", a1);
}

void sub_21EC0EC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_21EC0ECE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_21EC0EE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21EC0F4D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC0FD98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21EC0FEE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_3_0(sqlite3 **a1)
{
  return sqlite3_errcode(*a1);
}

const char *OUTLINED_FUNCTION_4_0()
{
  sqlite3 **v0;

  return sqlite3_errmsg(*v0);
}

void sub_21EC127EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC12860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC128C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC12CF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC13070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC13EA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC14350(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC1444C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC148FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC14BE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC15058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC15918(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MKLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = MKLocalizedString_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&MKLocalizedString_onceToken, &__block_literal_global_0);
  objc_msgSend((id)MKLocalizedString_bundle, "localizedStringForKey:value:table:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_21EC17830(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC17C2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC181F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id FourCCString(unsigned int a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a1), BYTE2(a1), BYTE1(a1), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_21EC1881C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC189FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC18B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC19588(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC19AA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC19D58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC1A4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC1ACE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC1B1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
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

void migrationkit::signatures::get_signatures(uint64_t a1@<X8>)
{
  _BYTE *v3;
  _DWORD *v4;
  _DWORD *v5;
  _QWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _WORD *v12;
  _DWORD *v13;
  _DWORD *v14;
  _DWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  _DWORD *v18;
  _WORD *v19;
  _DWORD *v20;
  _DWORD *v21;
  _DWORD *v22;
  _DWORD *v23;
  _DWORD *v24;
  _DWORD *v25;
  _QWORD *v26;
  _BYTE *v27;
  _DWORD *v28;
  _OWORD *v29;
  _DWORD *v30;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  _WORD *v34;
  _WORD *v35;
  _WORD *v36;
  _BYTE *v37;
  _WORD *v38;
  _WORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  _DWORD *v42;
  _WORD *v43;
  _WORD *v44;
  _BYTE *v45;
  _DWORD *v46;
  _WORD *v47;
  _WORD *v48;
  _WORD *v49;
  _WORD *v50;
  _WORD *v51;
  _BYTE *v52;
  _WORD *v53;
  _WORD *v54;
  _DWORD *v55;
  _DWORD *v56;
  _BYTE *v57;
  _DWORD *v58;
  void *v59;
  void *v60;
  _BYTE *v61;
  char *v62;
  _WORD *v63;
  _WORD *v64;
  _WORD *v65;
  _WORD *v66;
  _DWORD *v67;
  _DWORD *v68;
  _DWORD *v69;
  _DWORD *v70;
  _DWORD *v71;
  _DWORD *v72;
  _DWORD *v73;
  _DWORD *v74;
  _BYTE *v75;
  _BYTE *v76;
  _QWORD *v77;
  _BYTE *v78;
  _DWORD *v79;
  _BYTE *v80;
  _WORD *v81;
  _DWORD *v82;
  char *v83;
  uint64_t v84;
  unsigned __int8 v85[24];
  int v86;
  _BYTE *v87;
  uint64_t v88;
  _QWORD v89[3];
  int v90;
  _DWORD *v91;
  uint64_t v92;
  _QWORD v93[3];
  int v94;
  _DWORD *v95;
  uint64_t v96;
  _QWORD v97[3];
  int v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD v101[3];
  int v102;
  _DWORD *v103;
  uint64_t v104;
  _QWORD v105[3];
  int v106;
  _DWORD *v107;
  uint64_t v108;
  _QWORD v109[3];
  int v110;
  _DWORD *v111;
  uint64_t v112;
  _QWORD v113[3];
  int v114;
  _DWORD *v115;
  uint64_t v116;
  _QWORD v117[3];
  int v118;
  _DWORD *v119;
  uint64_t v120;
  _QWORD v121[3];
  int v122;
  _WORD *v123;
  uint64_t v124;
  _QWORD v125[3];
  int v126;
  _DWORD *v127;
  uint64_t v128;
  _QWORD v129[3];
  int v130;
  _DWORD *v131;
  uint64_t v132;
  _QWORD v133[3];
  int v134;
  _DWORD *v135;
  uint64_t v136;
  _QWORD v137[3];
  int v138;
  _DWORD *v139;
  uint64_t v140;
  _QWORD v141[3];
  int v142;
  _DWORD *v143;
  uint64_t v144;
  _QWORD v145[3];
  int v146;
  _DWORD *v147;
  uint64_t v148;
  _QWORD v149[3];
  int v150;
  _WORD *v151;
  uint64_t v152;
  _QWORD v153[3];
  int v154;
  _DWORD *v155;
  uint64_t v156;
  _QWORD v157[3];
  int v158;
  _DWORD *v159;
  uint64_t v160;
  _QWORD v161[3];
  int v162;
  _DWORD *v163;
  uint64_t v164;
  _QWORD v165[3];
  int v166;
  _DWORD *v167;
  uint64_t v168;
  _QWORD v169[3];
  int v170;
  _DWORD *v171;
  uint64_t v172;
  _QWORD v173[3];
  int v174;
  _DWORD *v175;
  uint64_t v176;
  _QWORD v177[3];
  int v178;
  _QWORD *v179;
  uint64_t v180;
  _QWORD v181[3];
  int v182;
  _BYTE *v183;
  uint64_t v184;
  _QWORD v185[3];
  int v186;
  _DWORD *v187;
  uint64_t v188;
  _QWORD v189[3];
  int v190;
  _OWORD *v191;
  uint64_t v192;
  _QWORD v193[3];
  int v194;
  _DWORD *v195;
  uint64_t v196;
  _QWORD v197[3];
  int v198;
  _DWORD *v199;
  uint64_t v200;
  _QWORD v201[3];
  int v202;
  _DWORD *v203;
  uint64_t v204;
  _QWORD v205[3];
  int v206;
  _DWORD *v207;
  uint64_t v208;
  _QWORD v209[3];
  int v210;
  _WORD *v211;
  uint64_t v212;
  _QWORD v213[3];
  int v214;
  _WORD *v215;
  uint64_t v216;
  _QWORD v217[3];
  int v218;
  _WORD *v219;
  uint64_t v220;
  _QWORD v221[3];
  int v222;
  _BYTE *v223;
  uint64_t v224;
  _QWORD v225[3];
  int v226;
  _WORD *v227;
  uint64_t v228;
  _QWORD v229[3];
  int v230;
  _WORD *v231;
  uint64_t v232;
  _QWORD v233[3];
  int v234;
  _DWORD *v235;
  uint64_t v236;
  _QWORD v237[3];
  int v238;
  _DWORD *v239;
  uint64_t v240;
  _QWORD v241[3];
  int v242;
  _DWORD *v243;
  uint64_t v244;
  _QWORD v245[3];
  int v246;
  _WORD *v247;
  uint64_t v248;
  _QWORD v249[3];
  int v250;
  _WORD *v251;
  uint64_t v252;
  _QWORD v253[3];
  int v254;
  _BYTE *v255;
  uint64_t v256;
  _QWORD v257[3];
  int v258;
  _DWORD *v259;
  uint64_t v260;
  _QWORD v261[3];
  int v262;
  _WORD *v263;
  uint64_t v264;
  _QWORD v265[3];
  int v266;
  _WORD *v267;
  uint64_t v268;
  _QWORD v269[3];
  int v270;
  _WORD *v271;
  uint64_t v272;
  _QWORD v273[3];
  int v274;
  _WORD *v275;
  uint64_t v276;
  _QWORD v277[3];
  int v278;
  _WORD *v279;
  uint64_t v280;
  _QWORD v281[3];
  int v282;
  _BYTE *v283;
  uint64_t v284;
  _QWORD v285[3];
  int v286;
  _WORD *v287;
  uint64_t v288;
  _QWORD v289[3];
  int v290;
  _WORD *v291;
  uint64_t v292;
  _QWORD v293[3];
  int v294;
  _DWORD *v295;
  uint64_t v296;
  _QWORD v297[3];
  int v298;
  _DWORD *v299;
  uint64_t v300;
  _QWORD v301[3];
  int v302;
  _BYTE *v303;
  uint64_t v304;
  _QWORD v305[3];
  int v306;
  _DWORD *v307;
  uint64_t v308;
  _QWORD v309[3];
  int v310;
  void *v311;
  uint64_t v312;
  _QWORD v313[3];
  int v314;
  void *v315;
  uint64_t v316;
  _QWORD v317[3];
  int v318;
  _BYTE *v319;
  uint64_t v320;
  _QWORD v321[3];
  int v322;
  char *v323;
  uint64_t v324;
  _QWORD v325[3];
  int v326;
  _WORD *v327;
  uint64_t v328;
  _QWORD v329[3];
  int v330;
  _WORD *v331;
  uint64_t v332;
  _QWORD v333[3];
  int v334;
  _WORD *v335;
  uint64_t v336;
  _QWORD v337[3];
  int v338;
  _WORD *v339;
  uint64_t v340;
  _QWORD v341[3];
  int v342;
  _DWORD *v343;
  uint64_t v344;
  _QWORD v345[3];
  int v346;
  _DWORD *v347;
  uint64_t v348;
  _QWORD v349[3];
  int v350;
  _DWORD *v351;
  uint64_t v352;
  _QWORD v353[3];
  int v354;
  _DWORD *v355;
  uint64_t v356;
  _QWORD v357[3];
  int v358;
  _DWORD *v359;
  uint64_t v360;
  _QWORD v361[3];
  int v362;
  _DWORD *v363;
  uint64_t v364;
  _QWORD v365[3];
  int v366;
  _DWORD *v367;
  uint64_t v368;
  _QWORD v369[3];
  int v370;
  _DWORD *v371;
  uint64_t v372;
  _QWORD v373[3];
  int v374;
  _BYTE *v375;
  uint64_t v376;
  _QWORD v377[3];
  int v378;
  _BYTE *v379;
  uint64_t v380;
  _QWORD v381[3];
  int v382;
  _QWORD *v383;
  uint64_t v384;
  _QWORD v385[3];
  int v386;
  _BYTE *v387;
  uint64_t v388;
  _QWORD v389[3];
  int v390;
  _DWORD *v391;
  uint64_t v392;
  _QWORD v393[3];
  int v394;
  _BYTE *v395;
  uint64_t v396;
  _QWORD v397[3];
  int v398;
  _WORD *v399;
  uint64_t v400;
  _QWORD v401[3];
  int v402;
  _DWORD *v403;
  uint64_t v404;
  _QWORD v405[3];
  int v406;
  char *v407;
  uint64_t v408;
  uint64_t v409;

  v409 = *MEMORY[0x24BDAC8D0];
  v3 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  *(_WORD *)v3 = -9985;
  v3[2] = -1;
  std::string::basic_string[abi:ne180100]<0>(v85, "jpeg");
  v86 = 3;
  v87 = v3;
  v88 = -1;
  v4 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v4[2] = 176622093;
  *(_QWORD *)v4 = 0x2020506A0C000000;
  std::string::basic_string[abi:ne180100]<0>(v89, "jp2");
  v90 = 12;
  v91 = v4;
  v92 = -1;
  v5 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v5 = 1375686655;
  std::string::basic_string[abi:ne180100]<0>(v93, "jpc");
  v94 = 4;
  v95 = v5;
  v96 = -1;
  v6 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  *v6 = 0xA1A0A0D474E5089;
  std::string::basic_string[abi:ne180100]<0>(v97, "png");
  v98 = 8;
  v99 = v6;
  v100 = -1;
  v7 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v7[2] = 1346520407;
  *(_QWORD *)v7 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v101, "webp");
  v102 = 12;
  v103 = v7;
  v104 = 0x700000004;
  v8 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v8 = 944130375;
  std::string::basic_string[abi:ne180100]<0>(v105, "gif");
  v106 = 4;
  v107 = v8;
  v108 = -1;
  v9 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v9[2] = 1718187617;
  *(_QWORD *)v9 = 0x7079746620000000;
  std::string::basic_string[abi:ne180100]<0>(v109, "avif");
  v110 = 12;
  v111 = v9;
  v112 = -1;
  v10 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v10 = 2771273;
  std::string::basic_string[abi:ne180100]<0>(v113, "tiff/little.endian");
  v114 = 4;
  v115 = v10;
  v116 = -1;
  v11 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v11 = 704662861;
  std::string::basic_string[abi:ne180100]<0>(v117, "tiff/big.endian");
  v118 = 4;
  v119 = v11;
  v120 = -1;
  v12 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v12[2] = 26419;
  *(_DWORD *)v12 = 1887007846;
  std::string::basic_string[abi:ne180100]<0>(v121, "3gp/3g2");
  v122 = 6;
  v123 = v12;
  v124 = -1;
  v13 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v13 = 1936614249;
  std::string::basic_string[abi:ne180100]<0>(v125, "icns");
  v126 = 4;
  v127 = v13;
  v128 = -1;
  v14 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v14 = 0x10000;
  std::string::basic_string[abi:ne180100]<0>(v129, "ico");
  v130 = 4;
  v131 = v14;
  v132 = -1;
  v15 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v15 = -681629056;
  std::string::basic_string[abi:ne180100]<0>(v133, "cin");
  v134 = 4;
  v135 = v15;
  v136 = -1;
  v16 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v16 = 20000630;
  std::string::basic_string[abi:ne180100]<0>(v137, "exr");
  v138 = 4;
  v139 = v16;
  v140 = -1;
  v17 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v17 = -79212478;
  std::string::basic_string[abi:ne180100]<0>(v141, "bpg");
  v142 = 4;
  v143 = v17;
  v144 = -1;
  v18 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v18 = 1397768760;
  std::string::basic_string[abi:ne180100]<0>(v145, "psd");
  v146 = 4;
  v147 = v18;
  v148 = -1;
  v19 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v19 = 19778;
  std::string::basic_string[abi:ne180100]<0>(v149, "bmp");
  v150 = 2;
  v151 = v19;
  v152 = -1;
  v20 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v20 = 1179208774;
  std::string::basic_string[abi:ne180100]<0>(v153, "flif");
  v154 = 4;
  v155 = v20;
  v156 = -1;
  v21 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v21 = 1296255300;
  std::string::basic_string[abi:ne180100]<0>(v157, "dcm");
  v158 = 4;
  v159 = v21;
  v160 = -1;
  v22 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v22[2] = 541677121;
  *(_QWORD *)v22 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v161, "avi");
  v162 = 12;
  v163 = v22;
  v164 = -1;
  v23 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v23 = -1545648870;
  std::string::basic_string[abi:ne180100]<0>(v165, "mkv/webm");
  v166 = 4;
  v167 = v23;
  v168 = -1;
  v24 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v24 = -1174339584;
  std::string::basic_string[abi:ne180100]<0>(v169, "m2p");
  v170 = 4;
  v171 = v24;
  v172 = -1;
  v25 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v25 = -1291780096;
  std::string::basic_string[abi:ne180100]<0>(v173, "mpeg");
  v174 = 4;
  v175 = v25;
  v176 = -1;
  v26 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  *v26 = 0x6D6F736970797466;
  std::string::basic_string[abi:ne180100]<0>(v177, "mp4");
  v178 = 8;
  v179 = v26;
  v180 = -1;
  v27 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v27[2] = 86;
  *(_WORD *)v27 = 19526;
  std::string::basic_string[abi:ne180100]<0>(v181, "flv");
  v182 = 3;
  v183 = v27;
  v184 = -1;
  v28 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v28 = 808454705;
  std::string::basic_string[abi:ne180100]<0>(v185, "srt");
  v186 = 4;
  v187 = v28;
  v188 = -1;
  v29 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *v29 = xmmword_21EC45930;
  std::string::basic_string[abi:ne180100]<0>(v189, "asf/wma/wmv");
  v190 = 16;
  v191 = v29;
  v192 = -1;
  v30 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v30 = 1399285583;
  std::string::basic_string[abi:ne180100]<0>(v193, "ogg");
  v194 = 4;
  v195 = v30;
  v196 = -1;
  v31 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v31[2] = 1163280727;
  *(_QWORD *)v31 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v197, "wav");
  v198 = 12;
  v199 = v31;
  v200 = 0x700000004;
  v32 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v32 = 1130450022;
  std::string::basic_string[abi:ne180100]<0>(v201, "flac");
  v202 = 4;
  v203 = v32;
  v204 = -1;
  v33 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v33 = 1684960046;
  std::string::basic_string[abi:ne180100]<0>(v205, "snd");
  v206 = 4;
  v207 = v33;
  v208 = -1;
  v34 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v34 = -1025;
  std::string::basic_string[abi:ne180100]<0>(v209, "mp3");
  v210 = 2;
  v211 = v34;
  v212 = -1;
  v35 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v35 = -3073;
  std::string::basic_string[abi:ne180100]<0>(v213, "mp3/header2");
  v214 = 2;
  v215 = v35;
  v216 = -1;
  v36 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v36 = -3329;
  std::string::basic_string[abi:ne180100]<0>(v217, "mp3/header1");
  v218 = 2;
  v219 = v36;
  v220 = -1;
  v37 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v37[2] = 51;
  *(_WORD *)v37 = 17481;
  std::string::basic_string[abi:ne180100]<0>(v221, "mp3/ID3v2");
  v222 = 3;
  v223 = v37;
  v224 = -1;
  v38 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v38 = -3585;
  std::string::basic_string[abi:ne180100]<0>(v225, "aac/mpeg4");
  v226 = 2;
  v227 = v38;
  v228 = -1;
  v39 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v39 = -1537;
  std::string::basic_string[abi:ne180100]<0>(v229, "aac/mpeg2");
  v230 = 2;
  v231 = v39;
  v232 = -1;
  v40 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v40[2] = 541144141;
  *(_QWORD *)v40 = 0x7079746600000000;
  std::string::basic_string[abi:ne180100]<0>(v233, "m4a");
  v234 = 12;
  v235 = v40;
  v236 = 0x300000000;
  v41 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v41[2] = 879781683;
  *(_QWORD *)v41 = 0x7079746600000000;
  std::string::basic_string[abi:ne180100]<0>(v237, "3gp4");
  v238 = 12;
  v239 = v41;
  v240 = 0x300000000;
  v42 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v42 = 67324752;
  std::string::basic_string[abi:ne180100]<0>(v241, "zip");
  v242 = 4;
  v243 = v42;
  v244 = -1;
  v43 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v43 = -25313;
  std::string::basic_string[abi:ne180100]<0>(v245, "tar.z/lzw");
  v246 = 2;
  v247 = v43;
  v248 = -1;
  v44 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v44 = -24545;
  std::string::basic_string[abi:ne180100]<0>(v249, "tar.z/lzh");
  v250 = 2;
  v251 = v44;
  v252 = -1;
  v45 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v45[2] = 104;
  *(_WORD *)v45 = 23106;
  std::string::basic_string[abi:ne180100]<0>(v253, "bz2");
  v254 = 3;
  v255 = v45;
  v256 = -1;
  v46 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v46 = 1346984524;
  std::string::basic_string[abi:ne180100]<0>(v257, "lzip");
  v258 = 4;
  v259 = v46;
  v260 = -1;
  v47 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v47[2] = 14128;
  *(_DWORD *)v47 = 925906736;
  std::string::basic_string[abi:ne180100]<0>(v261, "cpio");
  v262 = 6;
  v263 = v47;
  v264 = -1;
  v48 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v48[2] = 1818;
  *(_DWORD *)v48 = 561144146;
  std::string::basic_string[abi:ne180100]<0>(v265, "rar");
  v266 = 6;
  v267 = v48;
  v268 = -1;
  v49 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v49[2] = 7207;
  *(_DWORD *)v49 = -1346602441;
  std::string::basic_string[abi:ne180100]<0>(v269, "7z");
  v270 = 6;
  v271 = v49;
  v272 = -1;
  v50 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v50 = -29921;
  std::string::basic_string[abi:ne180100]<0>(v273, "gz");
  v274 = 2;
  v275 = v50;
  v276 = -1;
  v51 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v51[2] = 90;
  *(_DWORD *)v51 = 1484404733;
  std::string::basic_string[abi:ne180100]<0>(v277, "xz");
  v278 = 6;
  v279 = v51;
  v280 = -1;
  v52 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v52[2] = -65;
  *(_WORD *)v52 = -17425;
  std::string::basic_string[abi:ne180100]<0>(v281, "txt/utf-8");
  v282 = 3;
  v283 = v52;
  v284 = -1;
  v53 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v53 = -257;
  std::string::basic_string[abi:ne180100]<0>(v285, "txt/utf-16le");
  v286 = 2;
  v287 = v53;
  v288 = -1;
  v54 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v54 = -2;
  std::string::basic_string[abi:ne180100]<0>(v289, "txt/utf-16be");
  v290 = 2;
  v291 = v54;
  v292 = -1;
  v55 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v55 = 65279;
  std::string::basic_string[abi:ne180100]<0>(v293, "txt/utf-32le");
  v294 = 4;
  v295 = v55;
  v296 = -1;
  v56 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v56 = -16842752;
  std::string::basic_string[abi:ne180100]<0>(v297, "txt/utf-32be");
  v298 = 4;
  v299 = v56;
  v300 = -1;
  v57 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v57[2] = 118;
  *(_WORD *)v57 = 12075;
  std::string::basic_string[abi:ne180100]<0>(v301, "txt/utf-7");
  v302 = 3;
  v303 = v57;
  v304 = -1;
  v58 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v58 = 1397760293;
  std::string::basic_string[abi:ne180100]<0>(v305, "ps");
  v306 = 4;
  v307 = v58;
  v308 = -1;
  v59 = malloc_type_malloc(0x16uLL, 0x100004077774924uLL);
  qmemcpy(v59, "%!PS-Adobe-3.0 EPSF-3.", 22);
  std::string::basic_string[abi:ne180100]<0>(v309, "eps/3.0");
  v310 = 22;
  v311 = v59;
  v312 = -1;
  v60 = malloc_type_malloc(0x17uLL, 0x100004077774924uLL);
  qmemcpy(v60, "%!PS-Adobe-3.1 EPSF-3.0", 23);
  std::string::basic_string[abi:ne180100]<0>(v313, "eps/3.1");
  v314 = 23;
  v315 = v60;
  v316 = -1;
  v61 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v61[4] = 45;
  *(_DWORD *)v61 = 1178882085;
  std::string::basic_string[abi:ne180100]<0>(v317, "pdf");
  v318 = 5;
  v319 = v61;
  v320 = -1;
  v62 = (char *)malloc_type_malloc(0xBuLL, 0x100004077774924uLL);
  *(_DWORD *)(v62 + 7) = 542001479;
  *(_QWORD *)v62 = *(_QWORD *)"-----BEGIN ";
  std::string::basic_string[abi:ne180100]<0>(v321, "pem");
  v322 = 11;
  v323 = v62;
  v324 = -1;
  v63 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v63[2] = 8300;
  *(_DWORD *)v63 = 1836597052;
  std::string::basic_string[abi:ne180100]<0>(v325, "xml");
  v326 = 6;
  v327 = v63;
  v328 = -1;
  v64 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v64[2] = 12646;
  *(_DWORD *)v64 = 1953651835;
  std::string::basic_string[abi:ne180100]<0>(v329, "rtf");
  v330 = 6;
  v331 = v64;
  v332 = -1;
  v65 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v65 = 23117;
  std::string::basic_string[abi:ne180100]<0>(v333, "exe/mz");
  v334 = 2;
  v335 = v65;
  v336 = -1;
  v66 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  *v66 = 19802;
  std::string::basic_string[abi:ne180100]<0>(v337, "exe/zm");
  v338 = 2;
  v339 = v66;
  v340 = -1;
  v67 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v67 = 1179403647;
  std::string::basic_string[abi:ne180100]<0>(v341, "elf");
  v342 = 4;
  v343 = v67;
  v344 = -1;
  v68 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v68 = -1095041334;
  std::string::basic_string[abi:ne180100]<0>(v345, "class");
  v346 = 4;
  v347 = v68;
  v348 = -1;
  v69 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v69 = -822415874;
  std::string::basic_string[abi:ne180100]<0>(v349, "mach-o/32-bit");
  v350 = 4;
  v351 = v69;
  v352 = -1;
  v70 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v70 = -805638658;
  std::string::basic_string[abi:ne180100]<0>(v353, "mach-o/64-bit");
  v354 = 4;
  v355 = v70;
  v356 = -1;
  v71 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v71 = -17958194;
  std::string::basic_string[abi:ne180100]<0>(v357, "mach-o/32-bit/reversed");
  v358 = 4;
  v359 = v71;
  v360 = -1;
  v72 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v72 = -17958193;
  std::string::basic_string[abi:ne180100]<0>(v361, "mach-o/64-bit/reversed");
  v362 = 4;
  v363 = v72;
  v364 = -1;
  v73 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v73 = -302060034;
  std::string::basic_string[abi:ne180100]<0>(v365, "jks");
  v366 = 4;
  v367 = v73;
  v368 = -1;
  v74 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v74 = 1836278016;
  std::string::basic_string[abi:ne180100]<0>(v369, "wasm");
  v370 = 4;
  v371 = v74;
  v372 = -1;
  v75 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v75[2] = 83;
  *(_WORD *)v75 = 22339;
  std::string::basic_string[abi:ne180100]<0>(v373, "swf/cws");
  v374 = 3;
  v375 = v75;
  v376 = -1;
  v76 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v76[2] = 83;
  *(_WORD *)v76 = 22342;
  std::string::basic_string[abi:ne180100]<0>(v377, "swf/fws");
  v378 = 3;
  v379 = v76;
  v380 = -1;
  v77 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  *v77 = 0xA3E686372613C21;
  std::string::basic_string[abi:ne180100]<0>(v381, "deb");
  v382 = 8;
  v383 = v77;
  v384 = -1;
  v78 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v78[4] = 0;
  *(_DWORD *)v78 = 256;
  std::string::basic_string[abi:ne180100]<0>(v385, "ttf");
  v386 = 5;
  v387 = v78;
  v388 = -1;
  v79 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v79 = 1330926671;
  std::string::basic_string[abi:ne180100]<0>(v389, "otf");
  v390 = 4;
  v391 = v79;
  v392 = -1;
  v80 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v80[4] = 49;
  *(_DWORD *)v80 = 808469571;
  std::string::basic_string[abi:ne180100]<0>(v393, "iso");
  v394 = 5;
  v395 = v80;
  v396 = -1;
  v81 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v81[2] = 29811;
  *(_DWORD *)v81 = 1768714338;
  std::string::basic_string[abi:ne180100]<0>(v397, "bplist");
  v398 = 6;
  v399 = v81;
  v400 = -1;
  v82 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *v82 = 825249875;
  std::string::basic_string[abi:ne180100]<0>(v401, "bin");
  v402 = 4;
  v403 = v82;
  v404 = -1;
  v83 = (char *)malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  strcpy(v83, "SQLite format 3");
  std::string::basic_string[abi:ne180100]<0>(v405, "sqlitedb");
  v406 = 16;
  v407 = v83;
  v408 = -1;
  std::unordered_map<std::string,sig>::unordered_map(a1, v85, 81);
  v84 = 3888;
  do
  {
    if ((char)v85[v84 - 25] < 0)
      operator delete(*(void **)&v85[v84 - 48]);
    v84 -= 48;
  }
  while (v84);
}

void sub_21EC1FDC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v12;

  v12 = 3888;
  while (1)
  {
    if (*(char *)(v10 + v12 - 25) < 0)
      operator delete(*(void **)(v10 + v12 - 48));
    v12 -= 48;
    if (!v12)
      _Unwind_Resume(exception_object);
  }
}

void migrationkit::signature::get_identifier(migrationkit::signature *this@<X0>, std::string *a2@<X8>)
{
  unsigned __int8 v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  int v18;
  int v19;
  int v20;
  __int128 v21;
  char v22;
  char **v23;
  char *v24;

  if ((v5 & 1) == 0
  {
    migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs = 0u;
    *(_OWORD *)&qword_2554805B0 = 0u;
    dword_2554805C0 = 1065353216;
    __cxa_atexit((void (*)(void *))std::unordered_map<std::string,sig>::~unordered_map[abi:ne180100], &migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs, &dword_21EC08000);
  }
  v6 = atomic_load(&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::flag);
  if (v6 != -1)
  {
    v24 = &v22;
    v23 = &v24;
    std::__call_once(&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::flag, &v23, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::$_0 &&>>);
  }
  v7 = qword_2554805B0;
  if (!qword_2554805B0)
  {
LABEL_26:
    std::string::basic_string[abi:ne180100]<0>(a2, "");
    return;
  }
  while (1)
  {
    v8 = *(_DWORD *)(v7 + 56);
    v9 = *(_DWORD *)(v7 + 40);
    if (v8 >= 0)
      v10 = v8;
    else
      v10 = v9;
    if ((int)v10 < 1)
    {
      v15 = *(_DWORD *)(v7 + 60);
      if (v15 < 0)
        v15 = -1;
      LODWORD(v11) = v15 + 1;
      if ((int)v11 < v9)
        goto LABEL_21;
      goto LABEL_25;
    }
    v11 = 0;
    while (1)
    {
      v12 = *((unsigned __int8 *)this + v11);
      v13 = *(unsigned __int8 *)(*(_QWORD *)(v7 + 48) + v11);
      if (v12 != v13)
        break;
      if (v10 == ++v11)
      {
        LODWORD(v11) = v10;
        break;
      }
    }
    v14 = *(_DWORD *)(v7 + 60);
    if (v14 + 1 > (int)v11)
      LODWORD(v11) = v14 + 1;
    if ((int)v11 < v9)
    {
LABEL_21:
      v16 = (unsigned __int8 *)(*(_QWORD *)(v7 + 48) + v11);
      v17 = (unsigned __int8 *)this + v11;
      while (1)
      {
        v19 = *v17++;
        v18 = v19;
        v20 = *v16++;
        if (v18 != v20)
          goto LABEL_25;
        LODWORD(v11) = v11 + 1;
        if (v9 <= (int)v11)
          goto LABEL_27;
      }
    }
    if (v12 == v13)
      break;
LABEL_25:
    v7 = *(_QWORD *)v7;
    if (!v7)
      goto LABEL_26;
  }
LABEL_27:
  if (*(char *)(v7 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v7 + 16), *(_QWORD *)(v7 + 24));
  }
  else
  {
    v21 = *(_OWORD *)(v7 + 16);
    a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 32);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v21;
  }
}

uint64_t migrationkit::signature::get_max_signature_length(migrationkit::signature *this)
{
  return 23;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E358B60, MEMORY[0x24BEDAAF0]);
}

void sub_21EC2021C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::unordered_map<std::string,sig>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 48 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,sig> const&>(a1, a2, (uint64_t)a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_21EC202E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,sig> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__construct_node_hash<std::pair<std::string const,sig> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_21EC2054C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__construct_node_hash<std::pair<std::string const,sig> const&>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __n128 result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x40uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  result = *(__n128 *)(a3 + 24);
  *(__n128 *)(v8 + 40) = result;
  *((_QWORD *)v8 + 7) = *(_QWORD *)(a3 + 40);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_21EC20604(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::$_0 &&>>()
{
  uint64_t v1[5];

  migrationkit::signatures::get_signatures((uint64_t)v1);
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__move_assign((uint64_t)&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs, v1);
  return std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table((uint64_t)v1);
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::clear(a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void sub_21EC242F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21EC243A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC248A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EC24AFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC24F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
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

void sub_21EC25A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21EC27FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21EC28094(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC284E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC28DEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_21EC2BDE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC2C538(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC2E9E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC2EA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21EC2EDB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

__CFRunLoop **migrationkit::usb::device::interface::create(migrationkit::usb::device::interface *this, __IOUSBDeviceController *a2)
{
  __CFRunLoop **v3;

  v3 = (__CFRunLoop **)operator new();
  *v3 = this;
  CFRetain(this);
  if (!migrationkit::usb::device::interface::setup_matching_notification((migrationkit::usb::device::interface *)v3))
  {
    migrationkit::usb::device::interface::stop(v3);
    migrationkit::usb::device::interface::close((migrationkit::usb::device::interface *)v3);
    MEMORY[0x2207B9754](v3, 0x10A0C403D4A21E0);
    return 0;
  }
  return v3;
}

void migrationkit::usb::device::interface::stop(__CFRunLoop **this)
{
  __CFRunLoop *v2;
  __CFRunLoop *v3;

  migrationkit::usb::device::interface::release_pipes((migrationkit::usb::device::interface *)this);
  v2 = this[2];
  if (v2)
  {
    v3 = this[4];
    if (v3)
    {
      (*(void (**)(__CFRunLoop *))(*(_QWORD *)v3 + 56))(v3);
      v2 = this[2];
    }
    CFRunLoopStop(v2);
  }
}

void migrationkit::usb::device::interface::close(migrationkit::usb::device::interface *this)
{
  io_object_t v2;
  IONotificationPort *v3;
  uint64_t v4;

  v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 6) = 0;
  }
  v3 = (IONotificationPort *)*((_QWORD *)this + 1);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((_QWORD *)this + 1) = 0;
  }
  v4 = *((_QWORD *)this + 4);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    *((_QWORD *)this + 4) = 0;
  }
  if (*(_QWORD *)this)
  {
    CFRelease(*(CFTypeRef *)this);
    *(_QWORD *)this = 0;
  }
}

BOOL migrationkit::usb::device::interface::setup_matching_notification(migrationkit::usb::device::interface *this)
{
  IONotificationPort *v2;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  CFMutableDictionaryRef v5;
  CFMutableDictionaryRef v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  kern_return_t v9;

  v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *((_QWORD *)this + 1) = v2;
  if (!v2)
    goto LABEL_7;
  RunLoopSource = IONotificationPortGetRunLoopSource(v2);
  Current = CFRunLoopGetCurrent();
  *((_QWORD *)this + 2) = Current;
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  v5 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v5)
    goto LABEL_7;
  v6 = v5;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    CFRelease(v6);
LABEL_7:
    v9 = 5;
    return v9 == 0;
  }
  v8 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("USBDeviceFunction"), CFSTR("MigrationKit Interface"));
  CFDictionarySetValue(v6, CFSTR("IOPropertyMatch"), v8);
  CFRelease(v8);
  v9 = IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 1), "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)interface_matching_callback, this, (io_iterator_t *)this + 6);
  if (!v9)
  {
    interface_matching_callback((uint64_t)this, *((_DWORD *)this + 6));
    v9 = 0;
  }
  return v9 == 0;
}

uint64_t interface_matching_callback(uint64_t result, io_iterator_t iterator)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  BOOL v7;
  _OWORD v8[8];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (iterator)
  {
    v3 = result;
    memset(v8, 0, sizeof(v8));
    result = IOIteratorNext(iterator);
    if ((_DWORD)result)
    {
      v4 = result;
      LOBYTE(v5) = 0;
      while (1)
      {
        MEMORY[0x2207B94D8](v4, v8);
        if (!v5)
        {
          v6 = *(_QWORD *)&v8[0] ^ 0x6F6974617267694DLL | *((_QWORD *)&v8[0] + 1) ^ 0x746E492074694B6ELL | *(_QWORD *)((char *)v8 + 14) ^ 0x656361667265746ELL;
          v5 = v6 == 0;
          if (v6)
            v7 = 1;
          else
            v7 = v3 == 0;
          if (v7)
            goto LABEL_11;
          migrationkit::usb::device::interface::start(v3, v4);
        }
        v5 = 1;
LABEL_11:
        result = IOIteratorNext(iterator);
        v4 = result;
        if (!(_DWORD)result)
        {
          if (v5)
            return IOObjectRelease(iterator);
          return result;
        }
      }
    }
  }
  return result;
}

BOOL migrationkit::usb::device::interface::create_pipes(migrationkit::usb::device::interface *this)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  _BOOL8 pipe;

  v2 = malloc_type_malloc(0x38uLL, 0x2004093837F09uLL);
  v3 = 0;
  *((_QWORD *)this + 5) = v2;
  do
  {
    *(_QWORD *)(*((_QWORD *)this + 5) + v3) = 0;
    v3 += 8;
  }
  while (v3 != 56);
  v4 = 0;
  while (1)
  {
    v5 = malloc_type_malloc(0x28uLL, 0x1020040FAF5D19FuLL);
    *v5 = 0u;
    v5[1] = 0u;
    *((_QWORD *)v5 + 4) = 0;
    *(_QWORD *)(*((_QWORD *)this + 5) + v4) = v5;
    pipe = migrationkit::usb::device::interface::create_pipe((uint64_t)this, (uint64_t)v5);
    if (!pipe)
      break;
    v4 += 8;
    if (v4 == 56)
      return pipe;
  }
  migrationkit::usb::device::interface::release_pipes(this);
  return pipe;
}

BOOL migrationkit::usb::device::interface::create_pipe(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v5;
  const void *v6;
  const void *v7;
  _QWORD *v8;
  const void *v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v3 + 128))(v3, 2, 0, 0xFFFFFFFFLL, 0, 0, 0, a2);
    if (!v5)
    {
      v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(**(_QWORD **)(a1 + 32) + 128))(*(_QWORD *)(a1 + 32), 2, 1, 0xFFFFFFFFLL, 0, 0, 0, a2 + 8);
      if (!v5)
      {
        v6 = *(const void **)(a2 + 16);
        if (v6)
        {
          CFRelease(v6);
          *(_QWORD *)(a2 + 16) = 0;
        }
        v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 32) + 208))(*(_QWORD *)(a1 + 32), 0x100000, a2 + 16);
        if (!v5)
        {
          v9 = *(const void **)(a2 + 24);
          v8 = (_QWORD *)(a2 + 24);
          v7 = v9;
          if (v9)
          {
            CFRelease(v7);
            *v8 = 0;
          }
          v5 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD *))(**(_QWORD **)(a1 + 32) + 208))(*(_QWORD *)(a1 + 32), 1024, v8);
        }
      }
    }
  }
  else
  {
    v5 = -536870160;
  }
  return v5 == 0;
}

void migrationkit::usb::device::interface::release_pipes(migrationkit::usb::device::interface *this)
{
  uint64_t i;
  _QWORD *v3;
  uint64_t v4;
  const void *v5;
  const void *v6;

  if (*((_QWORD *)this + 5))
  {
    for (i = 0; i != 56; i += 8)
    {
      v3 = *(_QWORD **)(*((_QWORD *)this + 5) + i);
      if (v3)
      {
        v4 = *((_QWORD *)this + 4);
        if (v4)
        {
          if (v3[1])
            (*(void (**)(uint64_t))(*(_QWORD *)v4 + 192))(v4);
          if (*v3)
            (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 192))(*((_QWORD *)this + 4));
        }
        v5 = (const void *)v3[2];
        if (v5)
        {
          CFRelease(v5);
          v3[2] = 0;
        }
        v6 = (const void *)v3[3];
        if (v6)
          CFRelease(v6);
        free(v3);
        *(_QWORD *)(*((_QWORD *)this + 5) + i) = 0;
      }
    }
    free(*((void **)this + 5));
    *((_QWORD *)this + 5) = 0;
  }
}

uint64_t migrationkit::usb::device::interface::get_endpoints(migrationkit::usb::device::interface *this, int *a2)
{
  *a2 = 7;
  return *((_QWORD *)this + 5);
}

uint64_t migrationkit::usb::device::interface::start(uint64_t this, io_service_t a2)
{
  uint64_t v3;
  const __CFUUID *v4;
  const __CFUUID *v5;
  IOCFPlugInInterface **v6;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v8;
  CFUUIDBytes v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  SInt32 theScore[2];
  IOCFPlugInInterface **theInterface;

  *(_QWORD *)theScore = 0;
  theInterface = 0;
  v13 = -1;
  if (a2)
  {
    v3 = this;
    v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v5 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    this = IOCreatePlugInInterfaceForService(a2, v4, v5, &theInterface, &theScore[1]);
    if (!(_DWORD)this)
    {
      v6 = theInterface;
      if (theInterface)
      {
        QueryInterface = (*theInterface)->QueryInterface;
        v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
        v9 = CFUUIDGetUUIDBytes(v8);
        v10 = (_QWORD *)(v3 + 32);
        v11 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t))QueryInterface)(v6, *(_QWORD *)&v9.byte0, *(_QWORD *)&v9.byte8, v3 + 32);
        this = IODestroyPlugInInterface(theInterface);
        theInterface = 0;
        if (!v11)
        {
          this = *v10;
          if (*v10)
          {
            this = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)this + 32))(this, 0);
            if (!(_DWORD)this)
            {
              this = (*(uint64_t (**)(_QWORD, const __CFString *))(*(_QWORD *)*v10 + 80))(*v10, CFSTR("MigrationKit Interface"));
              if (!(_DWORD)this)
              {
                this = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)*v10 + 88))(*v10, 255, 0);
                if (!(_DWORD)this)
                {
                  this = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)*v10 + 96))(*v10, 254, 0);
                  if (!(_DWORD)this)
                  {
                    this = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)*v10 + 104))(*v10, 1, 0);
                    if (!(_DWORD)this)
                    {
                      this = migrationkit::usb::device::interface::create_pipes((migrationkit::usb::device::interface *)v3);
                      if ((_DWORD)this)
                      {
                        this = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v10 + 136))(*v10);
                        if (!(_DWORD)this)
                        {
                          this = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 32)
                                                                                             + 72))(*(_QWORD *)(v3 + 32), message_callback, v3, v3);
                          if (!(_DWORD)this)
                          {
                            v12 = *MEMORY[0x24BDBD5A0];
                            this = (*(uint64_t (**)(_QWORD, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *), uint64_t (*)(), uint64_t (*)(), uint64_t, uint64_t, _QWORD, _QWORD))(**(_QWORD **)(v3 + 32) + 64))(*(_QWORD *)(v3 + 32), control_request_setup_callback, control_request_transmit_callback, control_request_receive_callback, v3, v3, *(_QWORD *)(v3 + 16), *MEMORY[0x24BDBD5A0]);
                            if (!(_DWORD)this)
                            {
                              this = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(v3 + 32) + 48))(*(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 16), v12);
                              if (!(_DWORD)this)
                              {
                                this = (*(uint64_t (**)(_QWORD, SInt32 *, int *))(*(_QWORD *)*v10 + 288))(*v10, theScore, &v13);
                                if (theScore[0] == 1)
                                  *(_DWORD *)(v3 + 28) = v13;
                                *(_DWORD *)(v3 + 24) = 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return this;
}

migrationkit::usb::device::interface *message_callback(migrationkit::usb::device::interface *this, int a2, _DWORD *a3, void *a4)
{
  if (this)
    return (migrationkit::usb::device::interface *)migrationkit::usb::device::interface::message(this, a2, a3, a4);
  return this;
}

uint64_t control_request_setup_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  if (a1)
    *a6 = -536870201;
  return 0xFFFFFFFFLL;
}

uint64_t control_request_receive_callback()
{
  return 3758097084;
}

uint64_t migrationkit::usb::device::interface::message(migrationkit::usb::device::interface *this, int a2, _DWORD *a3, void *a4)
{
  uint64_t result;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, _QWORD, _DWORD *, void *);
  int v11;

  result = 1;
  switch(a2)
  {
    case -469794544:
      for (i = 0; i != 56; i += 8)
      {
        v8 = *((_QWORD *)this + 4);
        v9 = *(_QWORD *)(*((_QWORD *)this + 5) + i);
        v11 = 0;
        if (!(*(unsigned int (**)(uint64_t, _QWORD, int *, void *))(*(_QWORD *)v8 + 200))(v8, *(_QWORD *)v9, &v11, a4))*(_DWORD *)(v9 + 36) = v11;
        if (!(*(unsigned int (**)(_QWORD, _QWORD, int *))(**((_QWORD **)this + 4) + 200))(*((_QWORD *)this + 4), *(_QWORD *)(v9 + 8), &v11))*(_DWORD *)(v9 + 32) = v11;
      }
      if (a3)
        *((_DWORD *)this + 7) = a3[1];
      result = 3;
      break;
    case -469794543:
      result = 4;
      break;
    case -469794542:
      result = 5;
      break;
    case -469794541:
      break;
    case -469794540:
      result = 2;
      break;
    default:
      result = 0;
      break;
  }
  v10 = (uint64_t (*)(uint64_t, _QWORD, _DWORD *, void *))*((_QWORD *)this + 7);
  if (v10)
    return v10(result, *((_QWORD *)this + 6), a3, a4);
  return result;
}

uint64_t migrationkit::usb::device::interface::read(uint64_t a1, _QWORD *a2, void **a3)
{
  size_t v4;
  const void *BytePtr;
  size_t size;

  size = 0x100000;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD, size_t *))(**(_QWORD **)(a1 + 32) + 152))(*(_QWORD *)(a1 + 32), *a2, a2[2], &size))
  {
    return 0xFFFFFFFFLL;
  }
  v4 = size;
  if ((uint64_t)size >= 1)
  {
    *a3 = malloc_type_malloc(size, 0x436193A2uLL);
    BytePtr = (const void *)IOUSBDeviceDataGetBytePtr();
    memcpy(*a3, BytePtr, size);
  }
  return v4;
}

uint64_t migrationkit::usb::device::interface::write(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  int v4;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v14;

  v4 = a4;
  if (a4 >= 1024)
    v8 = 1024;
  else
    v8 = a4;
  if (a4 == 1024)
  {
    v9 = 0;
  }
  else
  {
    v9 = a4 % *(_DWORD *)(a2 + 32) == 0;
    if (a4 < 1)
    {
      v10 = 0;
      if (a4 % *(_DWORD *)(a2 + 32))
        return v10;
      goto LABEL_15;
    }
  }
  LODWORD(v10) = 0;
  do
  {
    v11 = migrationkit::usb::device::interface::write_chunk(a1, a2, a3, v8);
    v10 = (v10 + v8);
    v4 -= v8;
    if (v4 >= 1024)
      v12 = 1024;
    else
      v12 = v4;
    if (v4 < 1)
      break;
    a3 += v8;
    v8 = v12;
  }
  while (v11 > 0);
  if (v9)
  {
LABEL_15:
    v14 = 0;
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t *))(**(_QWORD **)(a1 + 32) + 168))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 24), &v14);
  }
  return v10;
}

uint64_t migrationkit::usb::device::interface::write_chunk(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  void *BytePtr;
  uint64_t v10;

  BytePtr = (void *)IOUSBDeviceDataGetBytePtr();
  memcpy(BytePtr, a3, a4);
  v10 = a4;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD, uint64_t *))(**(_QWORD **)(a1 + 32) + 168))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 24), &v10))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v10;
  }
}

uint64_t migrationkit::usb::device::interface::set_state_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 48) = a2;
  *(_QWORD *)(result + 56) = a3;
  return result;
}

void sub_21EC33C34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC34630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3502C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC350AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC351B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3556C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC357F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC35870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC35988(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC35B34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC35F28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36068(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC361A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36440(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36598(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC366D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36884(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36A30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36BD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC36D98(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    +[MKLog log](MKLog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[MKAPIServer processPerformanceMetrics].cold.2();

    objc_end_catch();
    JUMPOUT(0x21EC36D5CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21EC38404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
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

void sub_21EC387A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EC398E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21EC39C50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC39E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC3A1D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EC3A398(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3A4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_21EC3A950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC3B4B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3B6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21EC3B8CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21EC3BA74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3BAF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3C114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_21EC3CE4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EC3D634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC118](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC130](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01D0](desc);
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x24BE04718]();
}

uint64_t IMCreateSuperFormatStringWithAppendedFileTransfers()
{
  return MEMORY[0x24BE50668]();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t IOUSBDeviceControllerCreate()
{
  return MEMORY[0x24BDD89D0]();
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus()
{
  return MEMORY[0x24BDD89D8]();
}

uint64_t IOUSBDeviceControllerSetDescription()
{
  return MEMORY[0x24BDD89E0]();
}

uint64_t IOUSBDeviceDataGetBytePtr()
{
  return MEMORY[0x24BDD89F0]();
}

uint64_t IOUSBDeviceDescriptionAppendConfiguration()
{
  return MEMORY[0x24BDD8A00]();
}

uint64_t IOUSBDeviceDescriptionAppendInterfaceToConfiguration()
{
  return MEMORY[0x24BDD8A08]();
}

uint64_t IOUSBDeviceDescriptionCreateFromController()
{
  return MEMORY[0x24BDD8A10]();
}

uint64_t IOUSBDeviceDescriptionRemoveAllConfigurations()
{
  return MEMORY[0x24BDD8A18]();
}

uint64_t IOUSBDeviceDescriptionSetAllowOverride()
{
  return MEMORY[0x24BDD8A20]();
}

uint64_t IOUSBDeviceDescriptionSetProductID()
{
  return MEMORY[0x24BDD8A28]();
}

uint64_t IOUSBDeviceDescriptionSetVendorID()
{
  return MEMORY[0x24BDD8A30]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x24BE1FAB0]();
}

uint64_t PNDecomposeForCountry()
{
  return MEMORY[0x24BE1FAC8]();
}

uint64_t SRP6a_client_method()
{
  return MEMORY[0x24BE08740]();
}

uint64_t SRP6a_server_method()
{
  return MEMORY[0x24BE08748]();
}

uint64_t SRP_compute_key()
{
  return MEMORY[0x24BE08750]();
}

uint64_t SRP_free()
{
  return MEMORY[0x24BE08758]();
}

uint64_t SRP_gen_pub()
{
  return MEMORY[0x24BE08760]();
}

uint64_t SRP_new()
{
  return MEMORY[0x24BE08768]();
}

uint64_t SRP_respond()
{
  return MEMORY[0x24BE08770]();
}

uint64_t SRP_set_auth_password()
{
  return MEMORY[0x24BE08778]();
}

uint64_t SRP_set_params()
{
  return MEMORY[0x24BE08780]();
}

uint64_t SRP_set_username()
{
  return MEMORY[0x24BE08788]();
}

uint64_t SRP_verify()
{
  return MEMORY[0x24BE08790]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopySHA256Digest()
{
  return MEMORY[0x24BDE88D0]();
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x24BDE8920]();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x24BDE8A40]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x24BDE8A58]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientGetDevice()
{
  return MEMORY[0x24BE67A10]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x24BE67BE0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x24BED22F8]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x24BED2498]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _PNCopyInternationalCodeForCountry()
{
  return MEMORY[0x24BE1FAE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E358B78(__p);
}

uint64_t operator delete()
{
  return off_24E358B80();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E358B88(__sz);
}

uint64_t operator new()
{
  return off_24E358B90();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

uint64_t cstr_free()
{
  return MEMORY[0x24BE08798]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x24BDE0A00](name, type, domain);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0B40](connection);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x24BDE1440](listener);
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1448](parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x24BDE1460](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x24BDE1468](listener, advertise_descriptor);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x24BDE14A0](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
  MEMORY[0x24BDE16C8](parameters, local_endpoint);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x24BDE1758](parameters, reuse_local_address);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x24BDE9580](identity);
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
  MEMORY[0x24BDE95E0](options, ciphersuite);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x24BDE9620](options, identity);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9628](options, version);
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x24BDE9630](options, version);
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x24BDE9640](options, peer_authentication_required);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x24BDE96B0](options, verify_block, verify_block_queue);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x24BDE96C0](trust);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE100](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1C8](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

