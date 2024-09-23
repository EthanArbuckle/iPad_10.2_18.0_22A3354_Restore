@implementation NTKVideoListingFactory

+ (id)sharedInstanceForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedInstanceForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&sharedInstanceForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&sharedInstanceForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&sharedInstanceForDevice____cachedDevice, v3);
    sharedInstanceForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __50__NTKVideoListingFactory_sharedInstanceForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = sharedInstanceForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedInstanceForDevice____lock);
  v11 = (id)sharedInstanceForDevice__instance;

  return v11;
}

void __50__NTKVideoListingFactory_sharedInstanceForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  v3 = -[NTKVideoListingFactory _initLibraryForDevice:]([NTKVideoListingFactory alloc], "_initLibraryForDevice:", v2);

  v4 = (void *)sharedInstanceForDevice__instance;
  sharedInstanceForDevice__instance = (uint64_t)v3;

}

- (id)defaultListingWithTheme:(unint64_t)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NTKVideoListingFactory _listingsWithTheme:](self, "_listingsWithTheme:", a3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "hasTag:", 1, (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)anyListingWithTheme:(unint64_t)a3 variant:(int64_t)a4 tag:(unint64_t)a5 notMatchingClip:(int64_t)a6
{
  void *v6;
  void *v7;

  -[NTKVideoListingFactory _listingsWithTheme:variant:tag:notMatchingClip:](self, "_listingsWithTheme:variant:tag:notMatchingClip:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v6, "count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)anyListingWithTheme:(unint64_t)a3 notMatchingVariant:(int64_t)a4 matchingTag:(unint64_t)a5
{
  void *v5;
  void *v6;

  -[NTKVideoListingFactory _listingsWithTheme:notMatchingVariant:matchingTag:](self, "_listingsWithTheme:notMatchingVariant:matchingTag:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v5, "count")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)posterImageWithTheme:(unint64_t)a3
{
  if (a3 > 2)
    return NTKImageNamedFromAssetsBundle(0);
  else
    return NTKImageNamedFromAssetsBundle(off_1E6BD5DE0[a3]);
}

- (int64_t)behaviorForTheme:(unint64_t)a3
{
  if (a3 <= 2)
    return 4 - a3;
  else
    return 2;
}

- (id)_initLibraryForDevice:(id)a3
{
  id v5;
  NTKVideoListingFactory *v6;
  NTKVideoListingFactory *v7;
  uint64_t v8;
  NSMutableSet *assetListings;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  NSArray *butterflyListings;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  void *v146;
  id v147;
  uint64_t v148;
  NSArray *jellyfishListings;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  id v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  uint64_t v162;
  NSArray *flowerListings;
  NTKVideoListingFactory *v164;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  void *v212;
  id v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  void *v218;
  id v219;
  void *v220;
  id v221;
  void *v222;
  id v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  id v228;
  void *v229;
  id v230;
  void *v231;
  id v232;
  void *v233;
  id v234;
  void *v235;
  id v236;
  void *v237;
  id v238;
  void *v239;
  id v240;
  void *v241;
  id v242;
  void *v243;
  id v244;
  id v245;
  void *v246;
  id v247;
  void *v248;
  id v249;
  void *v250;
  id v251;
  id v252;
  void *v253;
  id v254;
  void *v255;
  id v256;
  id v257;
  void *v258;
  id v259;
  void *v260;
  id v261;
  void *v262;
  id v263;
  void *v264;
  id v265;
  id v266;
  void *v267;
  id v268;
  void *v269;
  id v270;
  void *v271;
  id v272;
  void *v273;
  id v274;
  void *v275;
  id v276;
  void *v277;
  id v278;
  id v279;
  void *v280;
  id v281;
  id v282;
  void *v283;
  id v284;
  id v285;
  void *v286;
  id v287;
  id v288;
  void *v289;
  id v290;
  id v291;
  void *v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  id v297;
  void *v298;
  id v299;
  id v300;
  void *v301;
  id v302;
  id v303;
  void *v304;
  id v305;
  id v306;
  void *v307;
  id v308;
  id v309;
  void *v310;
  id v311;
  id v312;
  id v313;
  void *v314;
  id v315;
  id v316;
  id v317;
  void *v318;
  id v319;
  id v320;
  id v321;
  id v322;
  id v323;
  id v324;
  id v325;
  objc_super v326;
  _QWORD v327[8];
  _QWORD v328[19];
  _QWORD v329[100];
  _QWORD v330[52];
  _QWORD v331[54];

  v331[52] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v326.receiver = self;
  v326.super_class = (Class)NTKVideoListingFactory;
  v6 = -[NTKVideoListingFactory init](&v326, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_opt_new();
    assetListings = v7->_assetListings;
    v7->_assetListings = (NSMutableSet *)v8;

    v330[0] = &unk_1E6C9F340;
    v322 = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.862745098, 1.0, 0.980392157, 1.0);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    v331[0] = v318;
    v330[1] = &unk_1E6C9F358;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.811764706);
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    v331[1] = v314;
    v330[2] = &unk_1E6C9F370;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.717647059, 0.925490196, 1.0, 1.0);
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    v331[2] = v310;
    v330[3] = &unk_1E6C9F388;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.980392157, 0.862745098, 1.0);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    v331[3] = v307;
    v330[4] = &unk_1E6C9F3A0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.819607843, 0.858823529, 0.988235294, 1.0);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    v331[4] = v304;
    v330[5] = &unk_1E6C9F3B8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.82745098, 0.780392157, 1.0);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v331[5] = v301;
    v330[6] = &unk_1E6C9F3D0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v331[6] = v298;
    v330[7] = &unk_1E6C9F3E8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.898039216, 0.898039216, 0.898039216, 1.0);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v331[7] = v295;
    v330[8] = &unk_1E6C9F400;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.749019608, 0.847058824, 0.815686275, 1.0);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v331[8] = v292;
    v330[9] = &unk_1E6C9F418;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v331[9] = v289;
    v330[10] = &unk_1E6C9F430;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941176471, 1.0, 0.745098039, 1.0);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v331[10] = v286;
    v330[11] = &unk_1E6C9F448;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.984313725, 0.717647059, 1.0);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v331[11] = v283;
    v330[12] = &unk_1E6C9F460;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.870588235, 0.870588235, 1.0, 1.0);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v331[12] = v280;
    v330[13] = &unk_1E6C9F478;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.866666667, 0.580392157, 1.0);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    v331[13] = v277;
    v330[14] = &unk_1E6C9F490;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.831372549, 0.941176471, 0.654901961, 1.0);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v331[14] = v275;
    v330[15] = &unk_1E6C9F4A8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.894117647, 0.564705882, 1.0);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v331[15] = v273;
    v330[16] = &unk_1E6C9F4C0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.509803922, 0.470588235, 1.0);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v331[16] = v271;
    v330[17] = &unk_1E6C9F4D8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.874509804, 0.898039216, 0.933333333, 1.0);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v331[17] = v269;
    v330[18] = &unk_1E6C9F4F0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.898039216, 0.568627451, 1.0);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    v331[18] = v267;
    v330[19] = &unk_1E6C9F508;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.929411765);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v331[19] = v264;
    v330[20] = &unk_1E6C9F520;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.921568627, 1.0);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    v331[20] = v262;
    v330[21] = &unk_1E6C9F538;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.823529412, 0.823529412, 0.705882353, 1.0);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v331[21] = v260;
    v330[22] = &unk_1E6C9F550;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.862745098, 1.0, 0.960784314, 1.0);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v331[22] = v258;
    v330[23] = &unk_1E6C9F568;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.823529412, 0.823529412, 1.0, 1.0);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v331[23] = v255;
    v330[24] = &unk_1E6C9F580;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.705882353, 0.980392157, 1.0, 1.0);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v331[24] = v253;
    v330[25] = &unk_1E6C9F598;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.823529412, 0.901960784, 1.0);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v331[25] = v250;
    v330[26] = &unk_1E6C9F5B0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.823529412, 0.901960784, 1.0);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v331[26] = v248;
    v330[27] = &unk_1E6C9F5C8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.823529412, 0.901960784, 1.0);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v331[27] = v246;
    v330[28] = &unk_1E6C9F5E0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.823529412, 0.901960784, 1.0);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v331[28] = v241;
    v330[29] = &unk_1E6C9F5F8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.725490196, 0.909803922, 1.0, 1.0);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v331[29] = v239;
    v330[30] = &unk_1E6C9F610;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.725490196, 0.909803922, 1.0, 1.0);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v331[30] = v237;
    v330[31] = &unk_1E6C9F628;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.725490196, 0.909803922, 1.0, 1.0);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v331[31] = v235;
    v330[32] = &unk_1E6C9F640;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.725490196, 0.909803922, 1.0, 1.0);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v331[32] = v233;
    v330[33] = &unk_1E6C9F658;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.705882353, 0.870588235, 1.0, 1.0);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v331[33] = v231;
    v330[34] = &unk_1E6C9F670;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.705882353, 0.870588235, 1.0, 1.0);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v331[34] = v229;
    v330[35] = &unk_1E6C9F688;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.980392157, 1.0, 1.0);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v331[35] = v227;
    v330[36] = &unk_1E6C9F6A0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.980392157, 1.0, 1.0);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v331[36] = v224;
    v330[37] = &unk_1E6C9F6B8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.980392157, 1.0, 1.0);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v331[37] = v222;
    v330[38] = &unk_1E6C9F6D0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.670588235, 0.988235294, 1.0, 1.0);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v331[38] = v220;
    v330[39] = &unk_1E6C9F6E8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.670588235, 0.988235294, 1.0, 1.0);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v331[39] = v243;
    v330[40] = &unk_1E6C9F700;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.549019608, 0.878431373, 1.0, 1.0);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v331[40] = v218;
    v330[41] = &unk_1E6C9F718;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.549019608, 0.878431373, 1.0, 1.0);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v331[41] = v216;
    v330[42] = &unk_1E6C9F730;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.980392157, 1.0, 1.0);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v331[42] = v214;
    v330[43] = &unk_1E6C9F748;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.745098039, 0.980392157, 1.0, 1.0);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v331[43] = v212;
    v330[44] = &unk_1E6C9F760;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.862745098, 0.862745098, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v331[44] = v10;
    v330[45] = &unk_1E6C9F778;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.952941176, 0.921568627, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v331[45] = v11;
    v330[46] = &unk_1E6C9F790;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.784313725, 0.862745098, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v331[46] = v12;
    v330[47] = &unk_1E6C9F7A8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.8, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v331[47] = v13;
    v330[48] = &unk_1E6C9F7C0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.901960784, 0.941176471, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v331[48] = v14;
    v330[49] = &unk_1E6C9F7D8;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.941176471, 0.705882353, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v331[49] = v15;
    v330[50] = &unk_1E6C9F7F0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.823529412, 0.666666667, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v331[50] = v16;
    v330[51] = &unk_1E6C9F808;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.941176471, 0.62745098, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v331[51] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v331, v330, 52);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F340);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v323 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("01-P-Blumei-H264"), CFSTR("01-P-Blumei-H264-A"), CFSTR("motion-black"), v19, 0, 5, 1, 4);

    v329[0] = v323;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F340);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v319 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("01-P-Blumei-H264"), CFSTR("01-P-Blumei-H264-B"), CFSTR("01-P-Blumei-H264"), v20, 0, 5, 2, 2);

    v329[1] = v319;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F340);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v315 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("01-P-Blumei-H264"), CFSTR("01-P-Blumei-H264-E"), CFSTR("01-P-Blumei-H264"), v21, 0, 5, 3, 2);

    v329[2] = v315;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F340);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v311 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("01-P-Blumei-H264"), CFSTR("01-P-Blumei-H264-F"), CFSTR("01-P-Blumei-H264"), v22, 0, 5, 4, 2);

    v329[3] = v311;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F358);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v308 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("02-A-Luna-H264"), CFSTR("02-A-Luna-H264-A"), CFSTR("motion-black"), v23, 0, 15, 1, 4);

    v329[4] = v308;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F358);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v305 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("02-A-Luna-H264"), CFSTR("02-A-Luna-H264-B"), CFSTR("02-A-Luna-H264"), v24, 0, 15, 2, 2);

    v329[5] = v305;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F358);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v302 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("02-A-Luna-H264"), CFSTR("02-A-Luna-H264-E"), CFSTR("02-A-Luna-H264"), v25, 0, 15, 3, 2);

    v329[6] = v302;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F358);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v299 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("02-A-Luna-H264"), CFSTR("02-A-Luna-H264-F"), CFSTR("02-A-Luna-H264"), v26, 0, 15, 4, 2);

    v329[7] = v299;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F370);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("03-M-Menelaus-H264"), CFSTR("03-M-Menelaus-H264-A"), CFSTR("motion-black"), v27, 0, 16, 1, 4);

    v329[8] = v296;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F370);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v293 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("03-M-Menelaus-H264"), CFSTR("03-M-Menelaus-H264-B"), CFSTR("03-M-Menelaus-H264"), v28, 0, 16, 2, 2);

    v329[9] = v293;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F370);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v290 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("03-M-Menelaus-H264"), CFSTR("03-M-Menelaus-H264-E"), CFSTR("03-M-Menelaus-H264"), v29, 0, 16, 3, 2);

    v329[10] = v290;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F370);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("03-M-Menelaus-H264"), CFSTR("03-M-Menelaus-H264-F"), CFSTR("03-M-Menelaus-H264"), v30, 0, 16, 4, 2);

    v329[11] = v287;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F388);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("04-O-Paradisea-H264"), CFSTR("04-O-Paradisea-H264-A"), CFSTR("motion-black"), v31, 0, 18, 1, 4);

    v329[12] = v284;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F388);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v281 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("04-O-Paradisea-H264"), CFSTR("04-O-Paradisea-H264-B"), CFSTR("04-O-Paradisea-H264"), v32, 0, 18, 2, 2);

    v329[13] = v281;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F388);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v278 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("04-O-Paradisea-H264"), CFSTR("04-O-Paradisea-H264-E"), CFSTR("04-O-Paradisea-H264"), v33, 0, 18, 3, 2);

    v329[14] = v278;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F388);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("04-O-Paradisea-H264"), CFSTR("04-O-Paradisea-H264-F"), CFSTR("04-O-Paradisea-H264"), v34, 0, 18, 4, 2);

    v329[15] = v276;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3A0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("05-K-Limborgii-H264"), CFSTR("05-K-Limborgii-H264-A"), CFSTR("motion-black"), v35, 0, 14, 1, 4);

    v329[16] = v274;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3A0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("05-K-Limborgii-H264"), CFSTR("05-K-Limborgii-H264-B"), CFSTR("05-K-Limborgii-H264"), v36, 0, 14, 2, 2);

    v329[17] = v272;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3A0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v270 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("05-K-Limborgii-H264"), CFSTR("05-K-Limborgii-H264-E"), CFSTR("05-K-Limborgii-H264"), v37, 0, 14, 3, 2);

    v329[18] = v270;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3A0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("05-K-Limborgii-H264"), CFSTR("05-K-Limborgii-H264-F"), CFSTR("05-K-Limborgii-H264"), v38, 0, 14, 4, 2);

    v329[19] = v268;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3B8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-A-Atlas-H264"), CFSTR("06-A-Atlas-H264-A"), CFSTR("motion-black"), v39, 0, 3, 1, 4);

    v329[20] = v266;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3B8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v265 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-A-Atlas-H264"), CFSTR("06-A-Atlas-H264-B"), CFSTR("06-A-Atlas-H264"), v40, 0, 3, 2, 2);

    v329[21] = v265;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3B8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v263 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-A-Atlas-H264"), CFSTR("06-A-Atlas-H264-E"), CFSTR("06-A-Atlas-H264"), v41, 0, 3, 3, 2);

    v329[22] = v263;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3B8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-A-Atlas-H264"), CFSTR("06-A-Atlas-H264-F"), CFSTR("06-A-Atlas-H264"), v42, 0, 3, 4, 2);

    v329[23] = v261;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3D0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v259 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("07-J-Rhadama-H264"), CFSTR("07-J-Rhadama-H264-A"), CFSTR("motion-black"), v43, 0, 19, 1, 4);

    v329[24] = v259;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3D0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v257 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("07-J-Rhadama-H264"), CFSTR("07-J-Rhadama-H264-B"), CFSTR("07-J-Rhadama-H264"), v44, 0, 19, 2, 2);

    v329[25] = v257;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3D0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("07-J-Rhadama-H264"), CFSTR("07-J-Rhadama-H264-E"), CFSTR("07-J-Rhadama-H264"), v45, 0, 19, 3, 2);

    v329[26] = v256;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3D0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("07-J-Rhadama-H264"), CFSTR("07-J-Rhadama-H264-F"), CFSTR("07-J-Rhadama-H264"), v46, 0, 19, 4, 2);

    v329[27] = v254;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3E8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v252 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("08-I-Idaeoides-H264"), CFSTR("08-I-Idaeoides-H264-A"), CFSTR("motion-black"), v47, 0, 10, 1, 4);

    v329[28] = v252;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3E8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("08-I-Idaeoides-H264"), CFSTR("08-I-Idaeoides-H264-B"), CFSTR("08-I-Idaeoides-H264"), v48, 0, 10, 2, 3);

    v329[29] = v251;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3E8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("08-I-Idaeoides-H264"), CFSTR("08-I-Idaeoides-H264-E"), CFSTR("08-I-Idaeoides-H264"), v49, 0, 10, 3, 2);

    v329[30] = v249;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F3E8);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("08-I-Idaeoides-H264"), CFSTR("08-I-Idaeoides-H264-F"), CFSTR("08-I-Idaeoides-H264"), v50, 0, 10, 4, 2);

    v329[31] = v247;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F400);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("09-A-Beatifica-H264"), CFSTR("09-A-Beatifica-H264-A"), CFSTR("motion-black"), v51, 0, 4, 1, 4);

    v329[32] = v245;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F400);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("09-A-Beatifica-H264"), CFSTR("09-A-Beatifica-H264-B"), CFSTR("09-A-Beatifica-H264"), v52, 0, 4, 2, 2);

    v329[33] = v244;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F400);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("09-A-Beatifica-H264"), CFSTR("09-A-Beatifica-H264-E"), CFSTR("09-A-Beatifica-H264"), v53, 0, 4, 3, 2);

    v329[34] = v242;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F400);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v240 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("09-A-Beatifica-H264"), CFSTR("09-A-Beatifica-H264-F"), CFSTR("09-A-Beatifica-H264"), v54, 0, 4, 4, 2);

    v329[35] = v240;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F418);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("10-C-Lechenaulti-H264"), CFSTR("10-C-Lechenaulti-H264-A"), CFSTR("motion-black"), v55, 0, 12, 1, 4);

    v329[36] = v238;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F418);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("10-C-Lechenaulti-H264"), CFSTR("10-C-Lechenaulti-H264-B"), CFSTR("10-C-Lechenaulti-H264"), v56, 0, 12, 2, 2);

    v329[37] = v236;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F418);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("10-C-Lechenaulti-H264"), CFSTR("10-C-Lechenaulti-H264-E"), CFSTR("10-C-Lechenaulti-H264"), v57, 0, 12, 3, 2);

    v329[38] = v234;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F418);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("10-C-Lechenaulti-H264"), CFSTR("10-C-Lechenaulti-H264-F"), CFSTR("10-C-Lechenaulti-H264"), v58, 0, 12, 4, 2);

    v329[39] = v232;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F430);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("11-G-Weiskei-H264"), CFSTR("11-G-Weiskei-H264-A"), CFSTR("motion-black"), v59, 0, 25, 1, 4);

    v329[40] = v230;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F430);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("11-G-Weiskei-H264"), CFSTR("11-G-Weiskei-H264-B"), CFSTR("11-G-Weiskei-H264"), v60, 0, 25, 2, 2);

    v329[41] = v228;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F430);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("11-G-Weiskei-H264"), CFSTR("11-G-Weiskei-H264-E"), CFSTR("11-G-Weiskei-H264"), v61, 0, 25, 3, 2);

    v329[42] = v226;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F430);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("11-G-Weiskei-H264"), CFSTR("11-G-Weiskei-H264-F"), CFSTR("11-G-Weiskei-H264"), v62, 0, 25, 4, 2);

    v329[43] = v225;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F448);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v223 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("12-H-Leucippe-H264"), CFSTR("12-H-Leucippe-H264-A"), CFSTR("motion-black"), v63, 0, 13, 1, 4);

    v329[44] = v223;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F448);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("12-H-Leucippe-H264"), CFSTR("12-H-Leucippe-H264-B"), CFSTR("12-H-Leucippe-H264"), v64, 0, 13, 2, 2);

    v329[45] = v221;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F448);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("12-H-Leucippe-H264"), CFSTR("12-H-Leucippe-H264-E"), CFSTR("12-H-Leucippe-H264"), v65, 0, 13, 3, 2);

    v329[46] = v219;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F448);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("12-H-Leucippe-H264"), CFSTR("12-H-Leucippe-H264-F"), CFSTR("12-H-Leucippe-H264"), v66, 0, 13, 4, 2);

    v329[47] = v217;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F460);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v215 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("13-P-Sylvia-H264"), CFSTR("13-P-Sylvia-H264-A"), CFSTR("motion-black"), v67, 0, 23, 1, 4);

    v329[48] = v215;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F460);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("13-P-Sylvia-H264"), CFSTR("13-P-Sylvia-H264-B"), CFSTR("13-P-Sylvia-H264"), v68, 0, 23, 2, 2);

    v329[49] = v213;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F460);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("13-P-Sylvia-H264"), CFSTR("13-P-Sylvia-H264-E"), CFSTR("13-P-Sylvia-H264"), v69, 0, 23, 3, 2);

    v329[50] = v211;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F460);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("13-P-Sylvia-H264"), CFSTR("13-P-Sylvia-H264-F"), CFSTR("13-P-Sylvia-H264"), v70, 0, 23, 4, 2);

    v329[51] = v210;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F478);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("14-C-Myrina-H264"), CFSTR("14-C-Myrina-H264-A"), CFSTR("motion-black"), v71, 0, 17, 1, 4);

    v329[52] = v209;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F478);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("14-C-Myrina-H264"), CFSTR("14-C-Myrina-H264-B"), CFSTR("14-C-Myrina-H264"), v72, 0, 17, 2, 2);

    v329[53] = v208;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F478);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("14-C-Myrina-H264"), CFSTR("14-C-Myrina-H264-E"), CFSTR("14-C-Myrina-H264"), v73, 0, 17, 3, 2);

    v329[54] = v207;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F478);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("14-C-Myrina-H264"), CFSTR("14-C-Myrina-H264-F"), CFSTR("14-C-Myrina-H264"), v74, 0, 17, 4, 2);

    v329[55] = v206;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F490);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("15-U-Ripheus-H264"), CFSTR("15-U-Ripheus-H264-A"), CFSTR("motion-black"), v75, 0, 20, 1, 4);

    v329[56] = v205;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F490);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("15-U-Ripheus-H264"), CFSTR("15-U-Ripheus-H264-B"), CFSTR("15-U-Ripheus-H264"), v76, 0, 20, 2, 2);

    v329[57] = v204;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F490);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("15-U-Ripheus-H264"), CFSTR("15-U-Ripheus-H264-E"), CFSTR("15-U-Ripheus-H264"), v77, 0, 20, 3, 2);

    v329[58] = v203;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F490);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("15-U-Ripheus-H264"), CFSTR("15-U-Ripheus-H264-F"), CFSTR("15-U-Ripheus-H264"), v78, 0, 20, 4, 2);

    v329[59] = v202;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4A8);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("16-M-Amphitryon-H264"), CFSTR("16-M-Amphitryon-H264-A"), CFSTR("motion-black"), v79, 0, 1, 1, 4);

    v329[60] = v201;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4A8);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("16-M-Amphitryon-H264"), CFSTR("16-M-Amphitryon-H264-B"), CFSTR("16-M-Amphitryon-H264"), v80, 0, 1, 2, 2);

    v329[61] = v200;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4A8);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("16-M-Amphitryon-H264"), CFSTR("16-M-Amphitryon-H264-E"), CFSTR("16-M-Amphitryon-H264"), v81, 0, 1, 3, 2);

    v329[62] = v199;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4A8);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("16-M-Amphitryon-H264"), CFSTR("16-M-Amphitryon-H264-F"), CFSTR("16-M-Amphitryon-H264"), v82, 0, 1, 4, 2);

    v329[63] = v198;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4C0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("17-C-Sangaris-H264"), CFSTR("17-C-Sangaris-H264-A"), CFSTR("motion-black"), v83, 0, 22, 1, 4);

    v329[64] = v197;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4C0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("17-C-Sangaris-H264"), CFSTR("17-C-Sangaris-H264-B"), CFSTR("17-C-Sangaris-H264"), v84, 0, 22, 2, 2);

    v329[65] = v196;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4C0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("17-C-Sangaris-H264"), CFSTR("17-C-Sangaris-H264-E"), CFSTR("17-C-Sangaris-H264"), v85, 0, 22, 3, 2);

    v329[66] = v195;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4C0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("17-C-Sangaris-H264"), CFSTR("17-C-Sangaris-H264-F"), CFSTR("17-C-Sangaris-H264"), v86, 0, 22, 4, 2);

    v329[67] = v194;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4D8);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("18-D-Timorensis-H264"), CFSTR("18-D-Timorensis-H264-A"), CFSTR("motion-black"), v87, 0, 24, 1, 4);

    v329[68] = v193;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4D8);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("18-D-Timorensis-H264"), CFSTR("18-D-Timorensis-H264-B"), CFSTR("18-D-Timorensis-H264"), v88, 0, 24, 2, 2);

    v329[69] = v192;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4D8);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("18-D-Timorensis-H264"), CFSTR("18-D-Timorensis-H264-E"), CFSTR("18-D-Timorensis-H264"), v89, 0, 24, 3, 2);

    v329[70] = v191;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4D8);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("18-D-Timorensis-H264"), CFSTR("18-D-Timorensis-H264-F"), CFSTR("18-D-Timorensis-H264"), v90, 0, 24, 4, 2);

    v329[71] = v190;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4F0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("19-P-Rurina-H264"), CFSTR("19-P-Rurina-H264-A"), CFSTR("motion-black"), v91, 0, 21, 1, 4);

    v329[72] = v189;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4F0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("19-P-Rurina-H264"), CFSTR("19-P-Rurina-H264-B"), CFSTR("19-P-Rurina-H264"), v92, 0, 21, 2, 2);

    v329[73] = v188;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4F0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("19-P-Rurina-H264"), CFSTR("19-P-Rurina-H264-E"), CFSTR("19-P-Rurina-H264"), v93, 0, 21, 3, 2);

    v329[74] = v187;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F4F0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("19-P-Rurina-H264"), CFSTR("19-P-Rurina-H264-F"), CFSTR("19-P-Rurina-H264"), v94, 0, 21, 4, 2);

    v329[75] = v186;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F508);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("20-C-Excelsior-H264"), CFSTR("20-C-Excelsior-H264-A"), CFSTR("motion-black"), v95, 0, 8, 1, 4);

    v329[76] = v185;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F508);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("20-C-Excelsior-H264"), CFSTR("20-C-Excelsior-H264-B"), CFSTR("20-C-Excelsior-H264"), v96, 0, 8, 2, 2);

    v329[77] = v184;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F508);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("20-C-Excelsior-H264"), CFSTR("20-C-Excelsior-H264-E"), CFSTR("20-C-Excelsior-H264"), v97, 0, 8, 3, 2);

    v329[78] = v183;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F508);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("20-C-Excelsior-H264"), CFSTR("20-C-Excelsior-H264-F"), CFSTR("20-C-Excelsior-H264"), v98, 0, 8, 4, 2);

    v329[79] = v182;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F520);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("21-I-Hypermnestra-H264"), CFSTR("21-I-Hypermnestra-H264-A"), CFSTR("motion-black"), v99, 0, 9, 1, 4);

    v329[80] = v181;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F520);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("21-I-Hypermnestra-H264"), CFSTR("21-I-Hypermnestra-H264-B"), CFSTR("21-I-Hypermnestra-H264"), v100, 0, 9, 2, 2);

    v329[81] = v180;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F520);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("21-I-Hypermnestra-H264"), CFSTR("21-I-Hypermnestra-H264-E"), CFSTR("21-I-Hypermnestra-H264"), v101, 0, 9, 3, 2);

    v329[82] = v179;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F520);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("21-I-Hypermnestra-H264"), CFSTR("21-I-Hypermnestra-H264-F"), CFSTR("21-I-Hypermnestra-H264"), v102, 0, 9, 4, 2);

    v329[83] = v178;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F538);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("22-L-Apallonia-H264"), CFSTR("22-L-Apallonia-H264-A"), CFSTR("motion-black"), v103, 0, 2, 1, 4);

    v329[84] = v177;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F538);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("22-L-Apallonia-H264"), CFSTR("22-L-Apallonia-H264-B"), CFSTR("22-L-Apallonia-H264"), v104, 0, 2, 2, 2);

    v329[85] = v176;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F538);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("22-L-Apallonia-H264"), CFSTR("22-L-Apallonia-H264-E"), CFSTR("22-L-Apallonia-H264"), v105, 0, 2, 3, 2);

    v329[86] = v175;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F538);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("22-L-Apallonia-H264"), CFSTR("22-L-Apallonia-H264-F"), CFSTR("22-L-Apallonia-H264"), v106, 0, 2, 4, 2);

    v329[87] = v174;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F550);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("23-P-Dido-H264"), CFSTR("23-P-Dido-H264-A"), CFSTR("motion-black"), v107, 0, 6, 1, 4);

    v329[88] = v173;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F550);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("23-P-Dido-H264"), CFSTR("23-P-Dido-H264-B"), CFSTR("23-P-Dido-H264"), v108, 0, 6, 2, 2);

    v329[89] = v172;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F550);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("23-P-Dido-H264"), CFSTR("23-P-Dido-H264-E"), CFSTR("23-P-Dido-H264"), v109, 0, 6, 3, 2);

    v329[90] = v171;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F550);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("23-P-Dido-H264"), CFSTR("23-P-Dido-H264-F"), CFSTR("23-P-Dido-H264"), v110, 0, 6, 4, 2);

    v329[91] = v170;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F568);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("24-Z-Doubledayi-H264"), CFSTR("24-Z-Doubledayi-H264-A"), CFSTR("motion-black"), v111, 0, 7, 1, 4);

    v329[92] = v169;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F568);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("24-Z-Doubledayi-H264"), CFSTR("24-Z-Doubledayi-H264-B"), CFSTR("24-Z-Doubledayi-H264"), v112, 0, 7, 2, 2);

    v329[93] = v168;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F568);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("24-Z-Doubledayi-H264"), CFSTR("24-Z-Doubledayi-H264-E"), CFSTR("24-Z-Doubledayi-H264"), v113, 0, 7, 3, 2);

    v329[94] = v167;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F568);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("24-Z-Doubledayi-H264"), CFSTR("24-Z-Doubledayi-H264-F"), CFSTR("24-Z-Doubledayi-H264"), v114, 0, 7, 4, 2);

    v329[95] = v166;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F580);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("25-P-Lorquinianus-H264"), CFSTR("25-P-Lorquinianus-H264-A"), CFSTR("motion-black"), v115, 0, 11, 1, 4);

    v329[96] = v116;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F580);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("25-P-Lorquinianus-H264"), CFSTR("25-P-Lorquinianus-H264-B"), CFSTR("25-P-Lorquinianus-H264"), v117, 0, 11, 2, 2);

    v329[97] = v118;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F580);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("25-P-Lorquinianus-H264"), CFSTR("25-P-Lorquinianus-H264-E"), CFSTR("25-P-Lorquinianus-H264"), v119, 0, 11, 3, 2);

    v329[98] = v120;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F580);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("25-P-Lorquinianus-H264"), CFSTR("25-P-Lorquinianus-H264-F"), CFSTR("25-P-Lorquinianus-H264"), v121, 0, 11, 4, 2);

    v329[99] = v122;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v329, 100);
    v123 = objc_claimAutoreleasedReturnValue();
    butterflyListings = v7->_butterflyListings;
    v7->_butterflyListings = (NSArray *)v123;

    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F598);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v324 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("01-Cyndaria"), CFSTR("01-Cyndaria"), CFSTR("motion-black"), v125, 1, 26, 1, 2);

    v328[0] = v324;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F5B0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v320 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("02-Cyndaria"), CFSTR("02-Cyndaria"), CFSTR("motion-black"), v126, 1, 27, 1, 2);

    v328[1] = v320;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F5C8);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("03-Cyndaria"), CFSTR("03-Cyndaria"), CFSTR("motion-black"), v127, 1, 28, 1, 2);

    v328[2] = v316;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F5E0);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v312 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("04-Cyndaria"), CFSTR("04-Cyndaria"), CFSTR("motion-black"), v128, 1, 29, 1, 2);

    v328[3] = v312;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F5F8);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v309 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("05-Lions-Mane"), CFSTR("05-Lions-Mane"), CFSTR("motion-black"), v129, 1, 30, 1, 2);

    v328[4] = v309;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F610);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-Lions-Mane-alt"), CFSTR("06-Lions-Mane-alt"), CFSTR("motion-black"), v130, 1, 31, 1, 2);

    v328[5] = v306;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F628);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v303 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("06-Lions-Mane"), CFSTR("06-Lions-Mane"), CFSTR("motion-black"), v131, 1, 32, 1, 2);

    v328[6] = v303;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F640);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v300 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("07-Lions-Mane"), CFSTR("07-Lions-Mane"), CFSTR("motion-black"), v132, 1, 33, 1, 2);

    v328[7] = v300;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F658);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("08-Nettle"), CFSTR("08-Nettle"), CFSTR("motion-black"), v133, 1, 34, 1, 2);

    v328[8] = v297;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F670);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("09-Nettle"), CFSTR("09-Nettle"), CFSTR("motion-black"), v134, 1, 35, 1, 2);

    v328[9] = v294;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F688);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("10-Moon"), CFSTR("10-Moon"), CFSTR("motion-black"), v135, 1, 36, 1, 2);

    v328[10] = v291;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F6A0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v288 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("11-Moon"), CFSTR("11-Moon"), CFSTR("motion-black"), v136, 1, 37, 1, 2);

    v328[11] = v288;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F6B8);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v285 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("12-Moon"), CFSTR("12-Moon"), CFSTR("motion-black"), v137, 1, 38, 1, 2);

    v328[12] = v285;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F6D0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("14-Root-Mouth"), CFSTR("14-Root-Mouth"), CFSTR("motion-black"), v138, 1, 39, 1, 2);

    v328[13] = v282;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F6E8);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v279 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("16-Root-Mouth"), CFSTR("16-Root-Mouth"), CFSTR("motion-black"), v139, 1, 40, 1, 2);

    v328[14] = v279;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F700);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("17-Blueblubber"), CFSTR("17-Blueblubber"), CFSTR("motion-black"), v140, 1, 41, 1, 2);

    v328[15] = v141;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F718);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("18-Blueblubber"), CFSTR("18-Blueblubber"), CFSTR("motion-black"), v142, 1, 42, 1, 2);

    v328[16] = v143;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F730);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("19-Moon"), CFSTR("19-Moon"), CFSTR("motion-black"), v144, 1, 43, 1, 3);

    v328[17] = v145;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F748);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("21-Moon"), CFSTR("21-Moon"), CFSTR("motion-black"), v146, 1, 44, 1, 2);

    v328[18] = v147;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v328, 19);
    v148 = objc_claimAutoreleasedReturnValue();
    jellyfishListings = v7->_jellyfishListings;
    v7->_jellyfishListings = (NSArray *)v148;

    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F760);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("CHRYSANTHEMUM"), CFSTR("CHRYSANTHEMUM"), CFSTR("motion-black"), v150, 2, 45, 1, 2);

    v327[0] = v325;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F778);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v321 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("GARDENIA"), CFSTR("GARDENIA"), CFSTR("motion-black"), v151, 2, 46, 1, 2);

    v327[1] = v321;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F790);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("PINK-DAHLIA"), CFSTR("PINK-DAHLIA"), CFSTR("motion-black"), v152, 2, 47, 1, 2);

    v327[2] = v317;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F7A8);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v313 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("PINK-PEONY"), CFSTR("PINK-PEONY"), CFSTR("motion-black"), v153, 2, 48, 1, 2);

    v327[3] = v313;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F7C0);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("PURPLE-PASSION"), CFSTR("PURPLE-PASSION"), CFSTR("motion-black"), v154, 2, 49, 1, 2);

    v327[4] = v155;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F7D8);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("WHITE-NIGELLA"), CFSTR("WHITE-NIGELLA"), CFSTR("motion-black"), v156, 2, 50, 1, 2);

    v327[5] = v157;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F7F0);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("WILDFLOWER"), CFSTR("WILDFLOWER"), CFSTR("motion-black"), v158, 2, 51, 1, 2);

    v327[6] = v159;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E6C9F808);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = -[NTKVideoListing initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:]([NTKVideoListing alloc], "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", v7->_device, CFSTR("YELLOW-POPPY"), CFSTR("YELLOW-POPPY"), CFSTR("motion-black"), v160, 2, 52, 1, 3);

    v327[7] = v161;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v327, 8);
    v162 = objc_claimAutoreleasedReturnValue();
    flowerListings = v7->_flowerListings;
    v7->_flowerListings = (NSArray *)v162;

    v164 = v7;
    v5 = v322;
  }

  return v7;
}

- (id)_listingsWithTheme:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return (&self->_butterflyListings)[a3];
}

- (id)_listingsWithTheme:(unint64_t)a3 variant:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[NTKVideoListingFactory _listingsWithTheme:](self, "_listingsWithTheme:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NTKVideoListingFactory__listingsWithTheme_variant___block_invoke;
  v9[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
  v9[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __53__NTKVideoListingFactory__listingsWithTheme_variant___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == -1 || objc_msgSend(a2, "variant") == *(_QWORD *)(a1 + 32);
}

- (id)_listingsWithTheme:(unint64_t)a3 notMatchingVariant:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[NTKVideoListingFactory _listingsWithTheme:](self, "_listingsWithTheme:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__NTKVideoListingFactory__listingsWithTheme_notMatchingVariant___block_invoke;
  v9[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
  v9[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __64__NTKVideoListingFactory__listingsWithTheme_notMatchingVariant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "variant") != *(_QWORD *)(a1 + 32);
}

- (id)_listingWithTheme:(unint64_t)a3 variant:(int64_t)a4 tag:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NTKVideoListingFactory _listingsWithTheme:variant:](self, "_listingsWithTheme:variant:", a3, a4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasTag:", a5, (_QWORD)v14) & 1) != 0)
        {
          v12 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_listingsWithTheme:(unint64_t)a3 variant:(int64_t)a4 tag:(unint64_t)a5 notMatchingClip:(int64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];

  -[NTKVideoListingFactory _listingsWithTheme:](self, "_listingsWithTheme:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__NTKVideoListingFactory__listingsWithTheme_variant_tag_notMatchingClip___block_invoke;
  v13[3] = &__block_descriptor_56_e25_B24__0_8__NSDictionary_16l;
  v13[4] = a4;
  v13[5] = a5;
  v13[6] = a6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __73__NTKVideoListingFactory__listingsWithTheme_variant_tag_notMatchingClip___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  v9 = (a1[4] == -1 || objc_msgSend(v7, "variant") == a1[4])
    && objc_msgSend(v8, "hasTag:", a1[5])
    && objc_msgSend(v8, "clip") != a1[6];

  return v9;
}

- (id)_listingsWithTheme:(unint64_t)a3 notMatchingVariant:(int64_t)a4 matchingTag:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  -[NTKVideoListingFactory _listingsWithTheme:](self, "_listingsWithTheme:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__NTKVideoListingFactory__listingsWithTheme_notMatchingVariant_matchingTag___block_invoke;
  v11[3] = &__block_descriptor_48_e25_B24__0_8__NSDictionary_16l;
  v11[4] = a4;
  v11[5] = a5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __76__NTKVideoListingFactory__listingsWithTheme_notMatchingVariant_matchingTag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "variant") == *(_QWORD *)(a1 + 32))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "hasTag:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)setVideoListingHasAssets:(id)a3
{
  -[NSMutableSet addObject:](self->_assetListings, "addObject:", a3);
}

- (void)discardAssets
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_assetListings;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "discardAssets", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_assetListings, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetListings, 0);
  objc_storeStrong((id *)&self->_flowerListings, 0);
  objc_storeStrong((id *)&self->_jellyfishListings, 0);
  objc_storeStrong((id *)&self->_butterflyListings, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
