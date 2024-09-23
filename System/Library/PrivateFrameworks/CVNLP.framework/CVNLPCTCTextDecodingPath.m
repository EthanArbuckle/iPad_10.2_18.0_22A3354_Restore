@implementation CVNLPCTCTextDecodingPath

- (CVNLPCTCTextDecodingPath)initWithLanguageResourceBundle:(id)a3 scoringFunction:(id)a4 initialCharacterLMState:(CVNLPLanguageModelWithState *)a5 characterTokenIDs:(vector<unsigned)int wordTokenIDs:(std:(vector<unsigned)int :(std:(BOOL)a8 :(BOOL)a9 allocator<unsigned int>> *)a7 allocator<unsigned int>> *)a6 optimizingAlignment:hasContext:
{
  id v16;
  id v17;
  CVNLPCTCTextDecodingPath *v18;
  CVNLPCTCTextDecodingPath *v19;
  vector<unsigned int, std::allocator<unsigned int>> *p_tokenString;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CVNLPCTCTextDecodingPath;
  v18 = -[CVNLPTextDecodingPath init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_blankLogProbability = -1022.0;
    v18->_nonBlankLogProbability = -1022.0;
    v18->_historyLexiconLogProbability = 0.0;
    v18->_activeWordLexiconLogProbability = 0.0;
    v18->_normalizedTotalLogProbability = 0.0;
    v18->_hasProblematicMixedScriptWords = 0;
    v18->_hasCalculatedHasProblematicMixedScriptWords = 0;
    v18->_lastCodeUnitType = 0;
    p_tokenString = &v18->_tokenString;
    if (&v19->_tokenString != a6)
      sub_1B03445E4(p_tokenString, (char *)a6->__begin_, (char *)a6->__end_, a6->__end_ - a6->__begin_);
    if (&v19->_histWordTokenIDs != a7)
      sub_1B03445E4(&v19->_histWordTokenIDs.__begin_, (char *)a7->__begin_, (char *)a7->__end_, a7->__end_ - a7->__begin_);
    v19->_beginningCurrentWord = 0;
    v19->_optimizingAlignment = a8;
    v19->_scoringFunction = v17;
    v19->_hasContext = a9;
    objc_storeStrong((id *)&v19->_languageResourceBundle, a3);
    v19->_hasExpanded = 0;
    if (a5)
      v19->_characterLMState = (CVNLPLanguageModelWithState *)CFRetain(a5);
  }

  return v19;
}

- (void)dealloc
{
  CVNLPLanguageModelWithState *characterLMState;
  objc_super v4;

  characterLMState = self->_characterLMState;
  if (characterLMState)
  {
    CFRelease(characterLMState);
    self->_characterLMState = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CVNLPCTCTextDecodingPath;
  -[CVNLPCTCTextDecodingPath dealloc](&v4, sel_dealloc);
}

- (void)setCharacterLanguageModelLogProbability:(double)a3
{
  self->super._characterLanguageModelLogProbability = a3;
}

- (void)setWordLanguageModelLogProbability:(double)a3
{
  self->super._wordLanguageModelLogProbability = a3;
}

- (void)setCharacterCount:(int64_t)a3
{
  self->super._characterCount = a3;
}

- (void)setPseudoSpaceCount:(int64_t)a3
{
  self->super._pseudoSpaceCount = a3;
}

- (void)setCharacterLMState:(CVNLPLanguageModelWithState *)a3
{
  CVNLPLanguageModelWithState *characterLMState;

  characterLMState = self->_characterLMState;
  if (characterLMState != a3)
  {
    CFRelease(characterLMState);
    self->_characterLMState = (CVNLPLanguageModelWithState *)CFRetain(a3);
  }
}

- (void)setLastTokenBoundaryLogProbability:(double)a3
{
  double *end;

  end = self->_tokenBoundaryLogProbabilities.__end_;
  if (end != self->_tokenBoundaryLogProbabilities.__begin_)
    *(end - 1) = a3;
}

- (int64_t)characterCount
{
  return self->super._characterCount;
}

- (int64_t)pseudoSpaceCount
{
  return self->super._pseudoSpaceCount;
}

- (int64_t)tokenCount
{
  return self->_histWordTokenIDs.__end_ - self->_histWordTokenIDs.__begin_;
}

- (double)modelLogProbability
{
  double blankLogProbability;
  double nonBlankLogProbability;
  double v4;
  double v5;
  long double v6;

  blankLogProbability = self->_blankLogProbability;
  nonBlankLogProbability = self->_nonBlankLogProbability;
  v4 = fmax(blankLogProbability, nonBlankLogProbability);
  v5 = fmin(blankLogProbability, nonBlankLogProbability);
  if (v5 >= -1021.0)
  {
    v6 = exp(v5 - v4);
    return log1p(v6) + v4;
  }
  return v4;
}

- (double)normalizedTotalLogProbability
{
  double result;

  result = self->_normalizedTotalLogProbability;
  if (result == 0.0)
  {
    result = (*((double (**)(void))self->_scoringFunction + 2))();
    self->_normalizedTotalLogProbability = result;
  }
  return result;
}

- (double)lexiconScore
{
  return self->_activeWordLexiconLogProbability + self->_historyLexiconLogProbability;
}

- (BOOL)hasProblematicMixedScriptWords
{
  if (!self->super._characterCount)
    return 0;
  if (self->_hasCalculatedHasProblematicMixedScriptWords)
    return self->_hasProblematicMixedScriptWords;
  self->_hasProblematicMixedScriptWords = sub_1B0360A74(self->super._string);
  self->_hasCalculatedHasProblematicMixedScriptWords = 1;
  return self->_hasProblematicMixedScriptWords;
}

- (double)lastTokenBoundaryLogProbability
{
  double *end;

  end = self->_tokenBoundaryLogProbabilities.__end_;
  if (end == self->_tokenBoundaryLogProbabilities.__begin_)
    return 0.0;
  else
    return *(end - 1);
}

- (double)scoreForTokenIndex:(int64_t)a3
{
  if (a3 <= 0)
    return self->_cumulativeTokenLogProbabilities.__begin_[a3] - 0.0;
  else
    return self->_cumulativeTokenLogProbabilities.__begin_[a3] - self->_cumulativeTokenLogProbabilities.__begin_[a3 - 1];
}

- (double)normalizedActivationLogProbability
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  objc_msgSend_modelLogProbability(self, a2, v2, v3);
  return v8 / (double)(objc_msgSend_characterCount(self, v5, v6, v7) + 1);
}

- (NSString)latestExpandedSymbolIncludingPseudospace
{
  return self->_latestExpandedSymbolIncludingPseudospace;
}

- (NSString)latestExpandedSymbol
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;

  if ((sub_1B0360D6C(self->_latestExpandedSymbolIncludingPseudospace, a2, v2, v3) & 1) != 0)
    v5 = 0;
  else
    v5 = self->_latestExpandedSymbolIncludingPseudospace;
  return v5;
}

- (BOOL)hasExpanded
{
  return self->_hasExpanded;
}

- (unint64_t)_currentTokenStringLength
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *end;
  uint64_t v5;
  NSString *string;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;

  end = self->_tokenStringSegmentationPositions.__end_;
  if (end == self->_tokenStringSegmentationPositions.__begin_)
    v5 = 0;
  else
    v5 = *(end - 1);
  string = self->super._string;
  v7 = objc_msgSend_length(string, a2, v2, v3);
  objc_msgSend_substringWithRange_(string, v8, v5, v7 - v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v9, v10, 2348810496, v11) >> 2;

  return v12;
}

- (void)commitTokenAtTimestep:(int64_t)a3 currentSymbolLogProbability:(double)a4 commitAction:(int64_t)a5 string:(id)a6 stemmingFromPath:(id)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  vector<unsigned long, std::allocator<unsigned long>> *p_tokenMaxActivations;
  unint64_t *end;
  unint64_t *begin;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  unint64_t v25;
  vector<unsigned long, std::allocator<unsigned long>> *p_tokenCommitCharacterLengths;
  unint64_t *value;
  unint64_t *v28;
  uint64_t v29;
  double v30;
  BOOL v31;
  const char *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t *v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _BYTE *v42;
  unint64_t *v43;
  unint64_t *v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  int64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  _OWORD *v58;
  unint64_t *v59;
  uint64_t v60;
  __int128 v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t *v66;
  _OWORD *v67;
  unint64_t *v68;
  uint64_t v69;
  __int128 v70;
  unint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  vector<unsigned long, std::allocator<unsigned long>> *p_tokenStringSegmentationPositions;
  unint64_t *v78;
  unint64_t *v79;
  unint64_t *v80;
  unint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _BYTE *v87;
  unint64_t *v88;
  unint64_t *v89;
  int64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t *v94;
  _OWORD *v95;
  unint64_t *v96;
  uint64_t v97;
  __int128 v98;
  unint64_t v99;
  unint64_t *v100;
  unint64_t *v101;
  unint64_t *v102;
  unint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  _BYTE *v109;
  unint64_t *v110;
  unint64_t *v111;
  int64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t *v116;
  _OWORD *v117;
  unint64_t *v118;
  uint64_t v119;
  __int128 v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  vector<double, std::allocator<double>> *p_cumulativeTokenLogProbabilities;
  double *v125;
  double *v126;
  double *v127;
  double *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  _BYTE *v134;
  double *v135;
  double *v136;
  int64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double *v141;
  _OWORD *v142;
  double *v143;
  uint64_t v144;
  __int128 v145;
  uint64_t v146;
  vector<double, std::allocator<double>> *p_tokenBoundaryLogProbabilities;
  double *v148;
  double *v149;
  double *v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  _BYTE *v156;
  double *v157;
  double *v158;
  uint64_t v159;
  int64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double *v164;
  _OWORD *v165;
  double *v166;
  uint64_t v167;
  __int128 v168;
  uint64_t v169;
  id v170;
  void *v171;
  id v172;

  v172 = a6;
  v15 = a7;
  if (!a5)
    goto LABEL_146;
  v16 = a3 + 1;
  p_tokenMaxActivations = &self->_tokenMaxActivations;
  begin = self->_tokenMaxActivations.__begin_;
  end = self->_tokenMaxActivations.__end_;
  v20 = end == begin || v16 > *(end - 1);
  if (objc_msgSend__currentTokenStringLength(self, v12, v13, v14))
    v24 = v20;
  else
    v24 = 0;
  if (v24)
  {
    v170 = v15;
    if (a5 != 1)
    {
      if (a5 != 2)
        goto LABEL_61;
      v25 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v172, v21, 2348810496, v23) >> 2;
      p_tokenCommitCharacterLengths = &self->_tokenCommitCharacterLengths;
      v28 = self->_tokenCommitCharacterLengths.__end_;
      value = self->_tokenCommitCharacterLengths.__end_cap_.__value_;
      if (v28 < value)
      {
        *v28 = v25;
        v29 = (uint64_t)(v28 + 1);
LABEL_60:
        p_tokenCommitCharacterLengths->__end_ = (unint64_t *)v29;
LABEL_61:
        v72 = objc_msgSend_length(self->super._string, v21, v22, v23, v170);
        v76 = v72;
        p_tokenStringSegmentationPositions = &self->_tokenStringSegmentationPositions;
        v79 = self->_tokenStringSegmentationPositions.__end_;
        v78 = self->_tokenStringSegmentationPositions.__end_cap_.__value_;
        if (v79 < v78)
        {
          *v79 = v72;
          v80 = v79 + 1;
          goto LABEL_82;
        }
        v81 = p_tokenStringSegmentationPositions->__begin_;
        v82 = (char *)v79 - (char *)p_tokenStringSegmentationPositions->__begin_;
        v83 = v82 >> 3;
        v84 = (v82 >> 3) + 1;
        if (v84 >> 61)
          sub_1B02D7758();
        v85 = (char *)v78 - (char *)v81;
        if (v85 >> 2 > v84)
          v84 = v85 >> 2;
        if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8)
          v86 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v86 = v84;
        if (v86)
        {
          if (v86 >> 61)
            sub_1B02D72AC();
          v87 = operator new(8 * v86);
          v88 = (unint64_t *)&v87[8 * v83];
          v89 = (unint64_t *)&v87[8 * v86];
          *v88 = v76;
          v80 = v88 + 1;
          v90 = (char *)v79 - (char *)v81;
          if (v79 == v81)
            goto LABEL_80;
        }
        else
        {
          v87 = 0;
          v88 = (unint64_t *)(8 * v83);
          v89 = 0;
          *(_QWORD *)(8 * v83) = v76;
          v80 = (unint64_t *)(8 * v83 + 8);
          v90 = (char *)v79 - (char *)v81;
          if (v79 == v81)
          {
LABEL_80:
            p_tokenStringSegmentationPositions->__begin_ = v88;
            self->_tokenStringSegmentationPositions.__end_ = v80;
            self->_tokenStringSegmentationPositions.__end_cap_.__value_ = v89;
            if (v81)
              operator delete(v81);
LABEL_82:
            v15 = v171;
            self->_tokenStringSegmentationPositions.__end_ = v80;
            v101 = self->_tokenMaxActivations.__end_;
            v100 = self->_tokenMaxActivations.__end_cap_.__value_;
            if (v101 < v100)
            {
              *v101 = v16;
              v102 = v101 + 1;
              goto LABEL_103;
            }
            v103 = p_tokenMaxActivations->__begin_;
            v104 = (char *)v101 - (char *)p_tokenMaxActivations->__begin_;
            v105 = v104 >> 3;
            v106 = (v104 >> 3) + 1;
            if (v106 >> 61)
              sub_1B02D7758();
            v107 = (char *)v100 - (char *)v103;
            if (v107 >> 2 > v106)
              v106 = v107 >> 2;
            if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8)
              v108 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v108 = v106;
            if (v108)
            {
              if (v108 >> 61)
                goto LABEL_147;
              v109 = operator new(8 * v108);
              v110 = (unint64_t *)&v109[8 * v105];
              v111 = (unint64_t *)&v109[8 * v108];
              *v110 = v16;
              v102 = v110 + 1;
              v112 = (char *)v101 - (char *)v103;
              if (v101 == v103)
                goto LABEL_101;
            }
            else
            {
              v109 = 0;
              v110 = (unint64_t *)(8 * v105);
              v111 = 0;
              *(_QWORD *)(8 * v105) = v16;
              v102 = (unint64_t *)(8 * v105 + 8);
              v112 = (char *)v101 - (char *)v103;
              if (v101 == v103)
              {
LABEL_101:
                p_tokenMaxActivations->__begin_ = v110;
                self->_tokenMaxActivations.__end_ = v102;
                self->_tokenMaxActivations.__end_cap_.__value_ = v111;
                if (v103)
                  operator delete(v103);
LABEL_103:
                self->_tokenMaxActivations.__end_ = v102;
                objc_msgSend_modelLogProbability(self, v73, v74, v75);
                v123 = v122;
                p_cumulativeTokenLogProbabilities = &self->_cumulativeTokenLogProbabilities;
                v126 = self->_cumulativeTokenLogProbabilities.__end_;
                v125 = self->_cumulativeTokenLogProbabilities.__end_cap_.__value_;
                if (v126 < v125)
                {
                  *(_QWORD *)v126 = v122;
                  v127 = v126 + 1;
LABEL_124:
                  self->_cumulativeTokenLogProbabilities.__end_ = v127;
                  p_tokenBoundaryLogProbabilities = &self->_tokenBoundaryLogProbabilities;
                  v149 = p_tokenBoundaryLogProbabilities->__end_;
                  v148 = p_tokenBoundaryLogProbabilities->__end_cap_.__value_;
                  if (v149 < v148)
                  {
                    *v149 = a4;
                    p_tokenBoundaryLogProbabilities->__end_ = v149 + 1;
                    goto LABEL_146;
                  }
                  v150 = p_tokenBoundaryLogProbabilities->__begin_;
                  v151 = (char *)v149 - (char *)p_tokenBoundaryLogProbabilities->__begin_;
                  v152 = v151 >> 3;
                  v153 = (v151 >> 3) + 1;
                  if (v153 >> 61)
                    sub_1B02D7758();
                  v154 = (char *)v148 - (char *)v150;
                  if (v154 >> 2 > v153)
                    v153 = v154 >> 2;
                  if ((unint64_t)v154 >= 0x7FFFFFFFFFFFFFF8)
                    v155 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v155 = v153;
                  if (!v155)
                  {
                    v156 = 0;
                    v157 = (double *)(8 * v152);
                    v158 = 0;
                    *(double *)(8 * v152) = a4;
                    v159 = 8 * v152 + 8;
                    v160 = (char *)v149 - (char *)v150;
                    if (v149 == v150)
                    {
LABEL_143:
                      p_tokenBoundaryLogProbabilities->__begin_ = v157;
                      p_tokenBoundaryLogProbabilities->__end_ = (double *)v159;
                      p_tokenBoundaryLogProbabilities->__end_cap_.__value_ = v158;
                      if (v150)
                        operator delete(v150);
                      p_tokenBoundaryLogProbabilities->__end_ = (double *)v159;
                      goto LABEL_146;
                    }
LABEL_137:
                    v161 = v160 - 8;
                    if (v161 < 0x58)
                      goto LABEL_160;
                    if ((unint64_t)((char *)v149 - v156 - v151) < 0x20)
                      goto LABEL_160;
                    v162 = (v161 >> 3) + 1;
                    v163 = 8 * (v162 & 0x3FFFFFFFFFFFFFFCLL);
                    v164 = &v149[v163 / 0xFFFFFFFFFFFFFFF8];
                    v157 = (double *)((char *)v157 - v163);
                    v165 = &v156[8 * v152 - 16];
                    v166 = v149 - 2;
                    v167 = v162 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v168 = *(_OWORD *)v166;
                      *(v165 - 1) = *((_OWORD *)v166 - 1);
                      *v165 = v168;
                      v165 -= 2;
                      v166 -= 4;
                      v167 -= 4;
                    }
                    while (v167);
                    v149 = v164;
                    if (v162 != (v162 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_160:
                      do
                      {
                        v169 = *((_QWORD *)v149-- - 1);
                        *((_QWORD *)v157-- - 1) = v169;
                      }
                      while (v149 != v150);
                    }
                    goto LABEL_143;
                  }
                  if (!(v155 >> 61))
                  {
                    v156 = operator new(8 * v155);
                    v157 = (double *)&v156[8 * v152];
                    v158 = (double *)&v156[8 * v155];
                    *v157 = a4;
                    v159 = (uint64_t)(v157 + 1);
                    v160 = (char *)v149 - (char *)v150;
                    if (v149 == v150)
                      goto LABEL_143;
                    goto LABEL_137;
                  }
LABEL_147:
                  sub_1B02D72AC();
                }
                v128 = p_cumulativeTokenLogProbabilities->__begin_;
                v129 = (char *)v126 - (char *)p_cumulativeTokenLogProbabilities->__begin_;
                v130 = v129 >> 3;
                v131 = (v129 >> 3) + 1;
                if (v131 >> 61)
                  sub_1B02D7758();
                v132 = (char *)v125 - (char *)v128;
                if (v132 >> 2 > v131)
                  v131 = v132 >> 2;
                if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8)
                  v133 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v133 = v131;
                if (v133)
                {
                  if (v133 >> 61)
                    sub_1B02D72AC();
                  v134 = operator new(8 * v133);
                  v135 = (double *)&v134[8 * v130];
                  v136 = (double *)&v134[8 * v133];
                  *(_QWORD *)v135 = v123;
                  v127 = v135 + 1;
                  v137 = (char *)v126 - (char *)v128;
                  if (v126 == v128)
                    goto LABEL_122;
                }
                else
                {
                  v134 = 0;
                  v135 = (double *)(8 * v130);
                  v136 = 0;
                  *(_QWORD *)(8 * v130) = v122;
                  v127 = (double *)(8 * v130 + 8);
                  v137 = (char *)v126 - (char *)v128;
                  if (v126 == v128)
                  {
LABEL_122:
                    p_cumulativeTokenLogProbabilities->__begin_ = v135;
                    self->_cumulativeTokenLogProbabilities.__end_ = v127;
                    self->_cumulativeTokenLogProbabilities.__end_cap_.__value_ = v136;
                    if (v128)
                      operator delete(v128);
                    goto LABEL_124;
                  }
                }
                v138 = v137 - 8;
                if (v138 < 0x58)
                  goto LABEL_161;
                if ((unint64_t)((char *)v126 - &v134[v129]) < 0x20)
                  goto LABEL_161;
                v139 = (v138 >> 3) + 1;
                v140 = 8 * (v139 & 0x3FFFFFFFFFFFFFFCLL);
                v141 = &v126[v140 / 0xFFFFFFFFFFFFFFF8];
                v135 = (double *)((char *)v135 - v140);
                v142 = &v134[8 * v130 - 16];
                v143 = v126 - 2;
                v144 = v139 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  v145 = *(_OWORD *)v143;
                  *(v142 - 1) = *((_OWORD *)v143 - 1);
                  *v142 = v145;
                  v142 -= 2;
                  v143 -= 4;
                  v144 -= 4;
                }
                while (v144);
                v126 = v141;
                if (v139 != (v139 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_161:
                  do
                  {
                    v146 = *((_QWORD *)v126-- - 1);
                    *((_QWORD *)v135-- - 1) = v146;
                  }
                  while (v126 != v128);
                }
                goto LABEL_122;
              }
            }
            v113 = v112 - 8;
            if (v113 < 0x58)
              goto LABEL_162;
            if ((unint64_t)((char *)v101 - &v109[v104]) < 0x20)
              goto LABEL_162;
            v114 = (v113 >> 3) + 1;
            v115 = 8 * (v114 & 0x3FFFFFFFFFFFFFFCLL);
            v116 = &v101[v115 / 0xFFFFFFFFFFFFFFF8];
            v110 = (unint64_t *)((char *)v110 - v115);
            v117 = &v109[8 * v105 - 16];
            v118 = v101 - 2;
            v119 = v114 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v120 = *(_OWORD *)v118;
              *(v117 - 1) = *((_OWORD *)v118 - 1);
              *v117 = v120;
              v117 -= 2;
              v118 -= 4;
              v119 -= 4;
            }
            while (v119);
            v101 = v116;
            if (v114 != (v114 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_162:
              do
              {
                v121 = *--v101;
                *--v110 = v121;
              }
              while (v101 != v103);
            }
            goto LABEL_101;
          }
        }
        v91 = v90 - 8;
        if (v91 < 0x58)
          goto LABEL_163;
        if ((unint64_t)((char *)v79 - v87 - v82) < 0x20)
          goto LABEL_163;
        v92 = (v91 >> 3) + 1;
        v93 = 8 * (v92 & 0x3FFFFFFFFFFFFFFCLL);
        v94 = &v79[v93 / 0xFFFFFFFFFFFFFFF8];
        v88 = (unint64_t *)((char *)v88 - v93);
        v95 = &v87[8 * v83 - 16];
        v96 = v79 - 2;
        v97 = v92 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v98 = *(_OWORD *)v96;
          *(v95 - 1) = *((_OWORD *)v96 - 1);
          *v95 = v98;
          v95 -= 2;
          v96 -= 4;
          v97 -= 4;
        }
        while (v97);
        v79 = v94;
        if (v92 != (v92 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_163:
          do
          {
            v99 = *--v79;
            *--v88 = v99;
          }
          while (v79 != v81);
        }
        goto LABEL_80;
      }
      v36 = p_tokenCommitCharacterLengths->__begin_;
      v46 = (char *)v28 - (char *)p_tokenCommitCharacterLengths->__begin_;
      v47 = v46 >> 3;
      v48 = (v46 >> 3) + 1;
      if (v48 >> 61)
        sub_1B02D7758();
      v49 = (char *)value - (char *)v36;
      if (v49 >> 2 > v48)
        v48 = v49 >> 2;
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
        v50 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v50 = v48;
      if (v50)
      {
        if (v50 >> 61)
          sub_1B02D72AC();
        v51 = (char *)v28 - (char *)p_tokenCommitCharacterLengths->__begin_;
        v52 = operator new(8 * v50);
        v46 = v51;
        v43 = (unint64_t *)&v52[8 * v47];
        v44 = (unint64_t *)&v52[8 * v50];
        *v43 = v25;
        v29 = (uint64_t)(v43 + 1);
        v53 = (char *)v28 - (char *)v36;
        if (v28 == v36)
          goto LABEL_58;
        goto LABEL_52;
      }
      v52 = 0;
      v43 = (unint64_t *)(8 * v47);
      v44 = 0;
      *(_QWORD *)(8 * v47) = v25;
      v29 = 8 * v47 + 8;
      v53 = (char *)v28 - (char *)v36;
      if (v28 != v36)
      {
LABEL_52:
        v63 = v53 - 8;
        if (v63 < 0x58)
          goto LABEL_164;
        if ((unint64_t)((char *)v28 - v52 - v46) < 0x20)
          goto LABEL_164;
        v64 = (v63 >> 3) + 1;
        v65 = 8 * (v64 & 0x3FFFFFFFFFFFFFFCLL);
        v66 = &v28[v65 / 0xFFFFFFFFFFFFFFF8];
        v43 = (unint64_t *)((char *)v43 - v65);
        v67 = &v52[8 * v47 - 16];
        v68 = v28 - 2;
        v69 = v64 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v70 = *(_OWORD *)v68;
          *(v67 - 1) = *((_OWORD *)v68 - 1);
          *v67 = v70;
          v67 -= 2;
          v68 -= 4;
          v69 -= 4;
        }
        while (v69);
        v28 = v66;
        if (v64 != (v64 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_164:
          do
          {
            v71 = *--v28;
            *--v43 = v71;
          }
          while (v28 != v36);
        }
      }
LABEL_58:
      p_tokenCommitCharacterLengths->__begin_ = v43;
      p_tokenCommitCharacterLengths->__end_ = (unint64_t *)v29;
      p_tokenCommitCharacterLengths->__end_cap_.__value_ = v44;
      if (v36)
        operator delete(v36);
      goto LABEL_60;
    }
    p_tokenCommitCharacterLengths = &self->_tokenCommitCharacterLengths;
    v35 = self->_tokenCommitCharacterLengths.__end_;
    v34 = self->_tokenCommitCharacterLengths.__end_cap_.__value_;
    if (v35 < v34)
    {
      *v35 = 0;
      v29 = (uint64_t)(v35 + 1);
      goto LABEL_60;
    }
    v36 = p_tokenCommitCharacterLengths->__begin_;
    v37 = (char *)v35 - (char *)p_tokenCommitCharacterLengths->__begin_;
    v38 = v37 >> 3;
    v39 = (v37 >> 3) + 1;
    if (v39 >> 61)
      sub_1B02D7758();
    v40 = (char *)v34 - (char *)v36;
    if (v40 >> 2 > v39)
      v39 = v40 >> 2;
    if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
      v41 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v41 = v39;
    if (v41)
    {
      if (v41 >> 61)
        sub_1B02D72AC();
      v42 = operator new(8 * v41);
      v43 = (unint64_t *)&v42[8 * v38];
      v44 = (unint64_t *)&v42[8 * v41];
      *v43 = 0;
      v29 = (uint64_t)(v43 + 1);
      v45 = (char *)v35 - (char *)v36;
      if (v35 == v36)
        goto LABEL_58;
    }
    else
    {
      v42 = 0;
      v43 = (unint64_t *)(8 * v38);
      v44 = 0;
      *(_QWORD *)(8 * v38) = 0;
      v29 = 8 * v38 + 8;
      v45 = (char *)v35 - (char *)v36;
      if (v35 == v36)
        goto LABEL_58;
    }
    v54 = v45 - 8;
    if (v54 < 0x58)
      goto LABEL_165;
    if ((unint64_t)((char *)v35 - &v42[v37]) < 0x20)
      goto LABEL_165;
    v55 = (v54 >> 3) + 1;
    v56 = 8 * (v55 & 0x3FFFFFFFFFFFFFFCLL);
    v57 = &v35[v56 / 0xFFFFFFFFFFFFFFF8];
    v43 = (unint64_t *)((char *)v43 - v56);
    v58 = &v42[8 * v38 - 16];
    v59 = v35 - 2;
    v60 = v55 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v61 = *(_OWORD *)v59;
      *(v58 - 1) = *((_OWORD *)v59 - 1);
      *v58 = v61;
      v58 -= 2;
      v59 -= 4;
      v60 -= 4;
    }
    while (v60);
    v35 = v57;
    if (v55 != (v55 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_165:
      do
      {
        v62 = *--v35;
        *--v43 = v62;
      }
      while (v35 != v36);
    }
    goto LABEL_58;
  }
  if (!v20
    || self->_optimizingAlignment
    && ((objc_msgSend_lastTokenBoundaryLogProbability(self, v21, v22, v23), end != begin) ? (v31 = v30 < a4) : (v31 = 0),
        v31))
  {
    objc_msgSend_modelLogProbability(self, v21, v22, v23);
    objc_msgSend_updateLastTokenWithMaxActivation_totalLogProbability_tokenBoundaryLogProbability_(self, v32, v16, v33);
  }
LABEL_146:

}

- (id)tokensWithTimestep:(int64_t)a3 isFinalTimestep:(BOOL)a4
{
  _BOOL4 v4;
  const char *v7;
  uint64_t v8;
  unint64_t *end;
  const char *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  unint64_t *begin;
  uint64_t v15;
  unint64_t v16;
  CVNLPCTCTextDecodingPath *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  NSObject *v33;
  void *v34;
  long double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  long double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  CVNLPTextDecodingToken *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  __int128 v54;
  unint64_t v55;
  void *v56;
  vector<unsigned long, std::allocator<unsigned long>> *p_tokenStringSegmentationPositions;
  void *v58;
  CVNLPCTCTextDecodingPath *v59;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  unint64_t v65;
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend__currentTokenStringLength(self, a2, a3, a4))
  {
    objc_msgSend_commitTokenAtTimestep_currentSymbolLogProbability_commitAction_string_stemmingFromPath_(self, v7, a3, 2, &stru_1E60CE768, self, 0.0);
  }
  else if (v4)
  {
    end = self->_tokenMaxActivations.__end_;
    if (self->_tokenMaxActivations.__begin_ != end)
      *(end - 1) = a3 + 1;
  }
  v59 = self;
  p_tokenStringSegmentationPositions = &self->_tokenStringSegmentationPositions;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v7, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_tokenStringSegmentationPositions.__begin_;
  v56 = v12;
  if (self->_tokenStringSegmentationPositions.__end_ != begin)
  {
    v15 = 0;
    v16 = 0;
    v55 = 0;
    *(_QWORD *)&v13 = 134218496;
    v54 = v13;
    do
    {
      v17 = v59;
      v18 = v59->_tokenCommitCharacterLengths.__begin_[v16];
      v19 = begin[v16] - v15 - v18;
      objc_msgSend_substringWithRange_(v59->super._string, v10, v15, v19, v54);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v20;
      if (v18)
      {
        objc_msgSend_substringWithRange_(v59->super._string, v21, v19 + v15, v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v23, v25, (uint64_t)v24, v26);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v59;
      }
      else
      {
        v24 = 0;
        v58 = v20;
      }
      objc_msgSend_scoreForTokenIndex_(v59, v21, v16, v22);
      v28 = v27;
      v31 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v58, v29, 2348810496, v30) >> 2;
      v32 = v28 / (double)v31;
      if (v32 >= 512.0)
      {
        if (qword_1EEEB2D28 != -1)
          dispatch_once(&qword_1EEEB2D28, &unk_1E60CDA48);
        v33 = (id)qword_1EEEB2D08;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v54;
          v61 = v28 / (double)v31;
          v62 = 2048;
          v63 = v28;
          v64 = 2048;
          v65 = v31;
          _os_log_impl(&dword_1B02D2000, v33, OS_LOG_TYPE_ERROR, "Unexpected tokenNormalizedScore issue? got %.8f from tokenScore = %.2f, characterCount = %ld", buf, 0x20u);
        }

        v32 = 512.0;
        v17 = v59;
      }
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = exp(v32);
      objc_msgSend_numberWithDouble_(v34, v36, v37, v38, (double)v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB37E8];
      v41 = exp(v17->_tokenBoundaryLogProbabilities.__begin_[v16]);
      objc_msgSend_numberWithDouble_(v40, v42, v43, v44, (double)v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v17->_tokenMaxActivations.__begin_[v16];
      v47 = [CVNLPTextDecodingToken alloc];
      v49 = (void *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v47, v48, (uint64_t)v23, (uint64_t)v39, v45, v55, v46 - v55, v24);
      objc_msgSend_addObject_(v56, v50, (uint64_t)v49, v51);
      v15 = p_tokenStringSegmentationPositions->__begin_[v16];
      v55 = v59->_tokenMaxActivations.__begin_[v16];

      v12 = v56;
      ++v16;
      begin = p_tokenStringSegmentationPositions->__begin_;
    }
    while (v16 < p_tokenStringSegmentationPositions->__end_ - p_tokenStringSegmentationPositions->__begin_);
  }
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v10, (uint64_t)v12, v11);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_string(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0360D78(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelLogProbability(self, v8, v9, v10);
  v12 = v11;
  objc_msgSend_normalizedTotalLogProbability(self, v13, v14, v15);
  v17 = v16;
  objc_msgSend_blankLogProbability(self, v18, v19, v20);
  v22 = v21;
  objc_msgSend_nonBlankLogProbability(self, v23, v24, v25);
  objc_msgSend_stringWithFormat_(v5, v26, (uint64_t)CFSTR("[\"%@\"], modelLogProb=%.8f, logProbTotalNorm=%.8f, logProbBlank=%.8f, logProbNonBlank=%.8f, %lu tokens"), v27, v7, v12, v17, v22, v28, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_string(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelLogProbability(self, v7, v8, v9);
  v11 = v10;
  objc_msgSend_normalizedTotalLogProbability(self, v12, v13, v14);
  v16 = v15;
  objc_msgSend_wordLanguageModelLogProbability(self, v17, v18, v19);
  v21 = v20;
  objc_msgSend_historyLexiconLogProbability(self, v22, v23, v24);
  v26 = v25;
  objc_msgSend_activeWordLexiconLogProbability(self, v27, v28, v29);
  v31 = v30;
  objc_msgSend_characterLanguageModelLogProbability(self, v32, v33, v34);
  objc_msgSend_stringWithFormat_(v5, v35, (uint64_t)CFSTR("[\"%@\"], logProbTotal=%.8f, logProbNormTotal=%.8f, logProbWordLM=%.8f, logProbHistoryLex=%.8f, logProbActiveLex=%.8f, logProbCharacterLM=%.8f, %lu tokens"), v36, v6, v11, v16, v21, v26, v31, v37, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (int64_t)compare:(id)a3
{
  uint64_t v3;
  double v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  int64_t v11;

  objc_msgSend_normalizedTotalLogProbability(a3, a2, (uint64_t)a3, v3);
  v6 = v5;
  objc_msgSend_normalizedTotalLogProbability(self, v7, v8, v9);
  if (v6 >= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v6 > v10)
    return 1;
  else
    return v11;
}

- (void)merge:(id)a3 logProbCumulator:(id)a4
{
  double (**v6)(_QWORD, double, double);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  vector<unsigned long, std::allocator<unsigned long>> *p_tokenMaxActivations;
  unint64_t *end;
  unint64_t *begin;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  unint64_t *v28;
  _BOOL4 v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  unint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  char *v47;

  v47 = (char *)a3;
  v6 = (double (**)(_QWORD, double, double))a4;
  self->_nonBlankLogProbability = v6[2](v6, self->_nonBlankLogProbability, *((double *)v47 + 38));
  self->_blankLogProbability = v6[2](v6, self->_blankLogProbability, *((double *)v47 + 37));
  if (self->_optimizingAlignment)
  {
    v10 = v47 + 208;
    v12 = *((_QWORD *)v47 + 26);
    v11 = *((_QWORD *)v47 + 27);
    v13 = v11 - v12;
    if (v11 != v12)
    {
      p_tokenMaxActivations = &self->_tokenMaxActivations;
      begin = self->_tokenMaxActivations.__begin_;
      end = self->_tokenMaxActivations.__end_;
      objc_msgSend_lastTokenBoundaryLogProbability(v47, v7, v8, v9);
      v18 = v17;
      objc_msgSend_lastTokenBoundaryLogProbability(self, v19, v20, v21);
      v25 = (v13 >> 3) - 1;
      v26 = end - begin;
      if (v18 <= v27)
      {
        objc_msgSend_lastTokenBoundaryLogProbability(v47, v22, v23, v24);
        v31 = v30;
        objc_msgSend_lastTokenBoundaryLogProbability(self, v32, v33, v34);
        v28 = p_tokenMaxActivations->__begin_;
        v35 = self->_tokenMaxActivations.__end_;
        if (v31 == v36)
        {
          if (v35 == v28)
          {
            v29 = 0;
          }
          else
          {
            objc_msgSend_scoreForTokenIndex_(v47, v22, v25, v24);
            v38 = v37;
            objc_msgSend_scoreForTokenIndex_(self, v39, v26 - 1, v40);
            v29 = v38 > v41;
            v28 = p_tokenMaxActivations->__begin_;
            if ((unint64_t *)((char *)self->_tokenMaxActivations.__end_
                                    - (char *)self->_tokenMaxActivations.__begin_) > (unint64_t *)8)
              goto LABEL_11;
          }
        }
        else
        {
          v29 = 0;
          if ((unint64_t)((char *)v35 - (char *)v28) > 8)
            goto LABEL_11;
        }
        if (!v29)
          goto LABEL_18;
      }
      else
      {
        v28 = p_tokenMaxActivations->__begin_;
        if ((unint64_t *)((char *)self->_tokenMaxActivations.__end_ - (char *)self->_tokenMaxActivations.__begin_) >= (unint64_t *)9)
        {
          LOBYTE(v29) = 1;
LABEL_11:
          v42 = *(_QWORD *)(*v10 + 8 * v25);
          if (v28[v26 - 2] > v42 || !v29)
            goto LABEL_18;
LABEL_17:
          v43 = *(double *)(*((_QWORD *)v47 + 17) + 8 * v25);
          objc_msgSend_lastTokenBoundaryLogProbability(v47, v22, v23, v24);
          objc_msgSend_updateLastTokenWithMaxActivation_totalLogProbability_tokenBoundaryLogProbability_(self, v44, v42, v45, v43, v46);
          goto LABEL_18;
        }
      }
      v42 = *(_QWORD *)(*v10 + 8 * v25);
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void)updateLastTokenWithMaxActivation:(int64_t)a3 totalLogProbability:(double)a4 tokenBoundaryLogProbability:(double)a5
{
  uint64_t v5;
  unint64_t *end;
  int64_t v7;

  end = self->_tokenMaxActivations.__end_;
  v7 = (char *)end - (char *)self->_tokenMaxActivations.__begin_;
  if (v7)
  {
    *(end - 1) = a3;
    *(double *)((char *)self->_cumulativeTokenLogProbabilities.__begin_ + v7 - 8) = a4;
    objc_msgSend_setLastTokenBoundaryLogProbability_(self, a2, a3, v5, a5);
  }
}

- (id)childPathWithBlankLogProb:(double)a3
{
  const char *v5;
  CVNLPCTCTextDecodingPath *v6;
  CVNLPLanguageResourceBundle *languageResourceBundle;
  id scoringFunction;
  CVNLPLanguageModelWithState *characterLMState;
  unsigned int *end;
  unsigned int *begin;
  int64_t v12;
  char *v13;
  char *v14;
  unsigned int *v15;
  unsigned int *v16;
  int64_t v17;
  char *v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CVNLPCTCTextDecodingPath *hasContext;
  uint64_t v24;
  NSString *string;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *__p;
  void *v71;
  char *v72;
  void *v73;
  void *v74;
  char *v75;

  v6 = [CVNLPCTCTextDecodingPath alloc];
  languageResourceBundle = self->_languageResourceBundle;
  scoringFunction = self->_scoringFunction;
  characterLMState = self->_characterLMState;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  begin = self->_tokenString.__begin_;
  end = self->_tokenString.__end_;
  v12 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v12 < 0)
      sub_1B02D7758();
    v13 = (char *)operator new((char *)end - (char *)begin);
    v14 = &v13[4 * (v12 >> 2)];
    v73 = v13;
    v75 = v14;
    memcpy(v13, begin, v12);
    v74 = v14;
  }
  v71 = 0;
  v72 = 0;
  __p = 0;
  v16 = self->_histWordTokenIDs.__begin_;
  v15 = self->_histWordTokenIDs.__end_;
  v17 = (char *)v15 - (char *)v16;
  if (v15 != v16)
  {
    if (v17 < 0)
      sub_1B02D7758();
    v18 = (char *)operator new((char *)v15 - (char *)v16);
    v19 = &v18[4 * (v17 >> 2)];
    __p = v18;
    v72 = v19;
    memcpy(v18, v16, v17);
    v71 = v19;
  }
  hasContext = (CVNLPCTCTextDecodingPath *)objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v6, v5, (uint64_t)languageResourceBundle, (uint64_t)scoringFunction, characterLMState, &v73, &__p, self->_optimizingAlignment, self->_hasContext);
  if (__p)
  {
    v71 = __p;
    operator delete(__p);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
  if (hasContext)
  {
    objc_msgSend_string(self, v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    string = hasContext->super._string;
    hasContext->super._string = (NSString *)v24;

    objc_storeStrong((id *)&hasContext->_latestExpandedSymbolIncludingPseudospace, self->_latestExpandedSymbolIncludingPseudospace);
    objc_msgSend_setBlankLogProbability_(hasContext, v26, v27, v28, a3);
    objc_msgSend_setCharacterLanguageModelLogProbability_(hasContext, v29, v30, v31, self->super._characterLanguageModelLogProbability);
    objc_msgSend_setHistoryLexiconLogProbability_(hasContext, v32, v33, v34, self->_historyLexiconLogProbability);
    objc_msgSend_setActiveWordLexiconLogProbability_(hasContext, v35, v36, v37, self->_activeWordLexiconLogProbability);
    objc_msgSend_setWordLanguageModelLogProbability_(hasContext, v38, v39, v40, self->super._wordLanguageModelLogProbability);
    objc_msgSend_lastTokenBoundaryLogProbability(self, v41, v42, v43);
    objc_msgSend_setLastTokenBoundaryLogProbability_(hasContext, v44, v45, v46);
    objc_msgSend_setCharacterCount_(hasContext, v47, self->super._characterCount, v48);
    objc_msgSend_setPseudoSpaceCount_(hasContext, v49, self->super._pseudoSpaceCount, v50);
    objc_msgSend_cursors(self, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_count(v54, v55, v56, v57);

    if (v58 >= 1)
    {
      objc_msgSend_cursors(self, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend_copy(v62, v63, v64, v65);
      objc_msgSend_setCursors_(hasContext, v67, (uint64_t)v66, v68);

    }
    hasContext->_beginningCurrentWord = self->_beginningCurrentWord;
    if (hasContext != self)
    {
      sub_1B03267E8(&hasContext->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__end_, self->_cumulativeTokenLogProbabilities.__end_ - self->_cumulativeTokenLogProbabilities.__begin_);
      sub_1B03267E8(&hasContext->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__end_, self->_tokenBoundaryLogProbabilities.__end_ - self->_tokenBoundaryLogProbabilities.__begin_);
      sub_1B03267E8(&hasContext->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__end_, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
      sub_1B03267E8(&hasContext->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__end_, self->_tokenMaxActivations.__end_ - self->_tokenMaxActivations.__begin_);
      sub_1B03267E8(&hasContext->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__end_, self->_tokenCommitCharacterLengths.__end_ - self->_tokenCommitCharacterLengths.__begin_);
    }
    hasContext->_hasProblematicMixedScriptWords = self->_hasProblematicMixedScriptWords;
    hasContext->_hasCalculatedHasProblematicMixedScriptWords = self->_hasCalculatedHasProblematicMixedScriptWords;
    hasContext->_lastCodeUnitType = self->_lastCodeUnitType;
  }
  return hasContext;
}

- (id)pathByExtendingWithString:(id)a3 extendedPathString:(id)a4 blankLogProb:(double)a5 nonBlankLogProb:(double)a6 timestep:(int64_t)a7 commitAction:(int64_t)a8 symbolLogProb:(double)a9
{
  const char *v15;
  CVNLPCTCTextDecodingPath *v16;
  CVNLPLanguageResourceBundle *languageResourceBundle;
  id scoringFunction;
  CVNLPLanguageModelWithState *characterLMState;
  unsigned int *end;
  unsigned int *begin;
  int64_t v22;
  char *v23;
  char *v24;
  unsigned int *v25;
  unsigned int *v26;
  int64_t v27;
  char *v28;
  char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t hasContext;
  unsigned int v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  long double v45;
  double v46;
  double v47;
  double v48;
  long double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  _BOOL4 v90;
  char v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  int16x4_t v107;
  void **v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  _BYTE *v118;
  _DWORD *v119;
  char *v120;
  int64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  _OWORD *v126;
  char *v127;
  uint64_t v128;
  __int128 v129;
  int v130;
  id obj;
  id v135;
  id v136;
  char *v137;
  char *v138;
  char *v139;
  void *__p;
  void *v141;
  char *v142;

  v136 = a3;
  obj = a4;
  v135 = a4;
  v16 = [CVNLPCTCTextDecodingPath alloc];
  languageResourceBundle = self->_languageResourceBundle;
  scoringFunction = self->_scoringFunction;
  characterLMState = self->_characterLMState;
  v141 = 0;
  v142 = 0;
  __p = 0;
  begin = self->_tokenString.__begin_;
  end = self->_tokenString.__end_;
  v22 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v22 < 0)
      sub_1B02D7758();
    v23 = (char *)operator new((char *)end - (char *)begin);
    v24 = &v23[4 * (v22 >> 2)];
    __p = v23;
    v142 = v24;
    memcpy(v23, begin, v22);
    v141 = v24;
  }
  v138 = 0;
  v139 = 0;
  v137 = 0;
  v26 = self->_histWordTokenIDs.__begin_;
  v25 = self->_histWordTokenIDs.__end_;
  v27 = (char *)v25 - (char *)v26;
  if (v25 != v26)
  {
    if (v27 < 0)
      sub_1B02D7758();
    v28 = (char *)operator new((char *)v25 - (char *)v26);
    v29 = &v28[4 * (v27 >> 2)];
    v137 = v28;
    v139 = v29;
    memcpy(v28, v26, v27);
    v138 = v29;
  }
  hasContext = objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v16, v15, (uint64_t)languageResourceBundle, (uint64_t)scoringFunction, characterLMState, &__p, &v137, self->_optimizingAlignment, self->_hasContext);
  if (v137)
  {
    v138 = v137;
    operator delete(v137);
  }
  if (__p)
  {
    v141 = __p;
    operator delete(__p);
  }
  if ((CVNLPCTCTextDecodingPath *)hasContext != self)
  {
    sub_1B03267E8((_QWORD *)(hasContext + 136), (char *)self->_cumulativeTokenLogProbabilities.__begin_, (char *)self->_cumulativeTokenLogProbabilities.__end_, self->_cumulativeTokenLogProbabilities.__end_ - self->_cumulativeTokenLogProbabilities.__begin_);
    sub_1B03267E8((_QWORD *)(hasContext + 160), (char *)self->_tokenBoundaryLogProbabilities.__begin_, (char *)self->_tokenBoundaryLogProbabilities.__end_, self->_tokenBoundaryLogProbabilities.__end_ - self->_tokenBoundaryLogProbabilities.__begin_);
    sub_1B03267E8((_QWORD *)(hasContext + 184), (char *)self->_tokenStringSegmentationPositions.__begin_, (char *)self->_tokenStringSegmentationPositions.__end_, self->_tokenStringSegmentationPositions.__end_ - self->_tokenStringSegmentationPositions.__begin_);
    sub_1B03267E8((_QWORD *)(hasContext + 208), (char *)self->_tokenMaxActivations.__begin_, (char *)self->_tokenMaxActivations.__end_, self->_tokenMaxActivations.__end_ - self->_tokenMaxActivations.__begin_);
    sub_1B03267E8((_QWORD *)(hasContext + 232), (char *)self->_tokenCommitCharacterLengths.__begin_, (char *)self->_tokenCommitCharacterLengths.__end_, self->_tokenCommitCharacterLengths.__end_ - self->_tokenCommitCharacterLengths.__begin_);
  }
  v34 = sub_1B0360D6C(v136, v30, v31, v32);
  objc_storeStrong((id *)(hasContext + 72), obj);
  objc_storeStrong((id *)(hasContext + 272), a3);
  *(_BYTE *)(hasContext + 280) = 1;
  objc_msgSend_setCharacterCount_((void *)hasContext, v35, self->super._characterCount + 1, v36);
  objc_msgSend_setPseudoSpaceCount_((void *)hasContext, v37, self->super._pseudoSpaceCount + v34, v38);
  v42 = *(double *)(hasContext + 296);
  v43 = fmax(v42, a5);
  v44 = fmin(v42, a5);
  if (v44 >= -1021.0)
  {
    v45 = exp(v44 - v43);
    v43 = log1p(v45) + v43;
  }
  *(double *)(hasContext + 296) = v43;
  v46 = *(double *)(hasContext + 304);
  v47 = fmax(v46, a6);
  v48 = fmin(v46, a6);
  if (v48 >= -1021.0)
  {
    v49 = exp(v48 - v47);
    v47 = log1p(v49) + v47;
  }
  *(double *)(hasContext + 304) = v47;
  objc_msgSend_lastTokenBoundaryLogProbability(self, v39, v40, v41);
  objc_msgSend_setLastTokenBoundaryLogProbability_((void *)hasContext, v50, v51, v52);
  objc_msgSend_commitTokenAtTimestep_currentSymbolLogProbability_commitAction_string_stemmingFromPath_((void *)hasContext, v53, a7, a8, v136, self, a9);
  objc_msgSend_wordLanguageModel(self->_languageResourceBundle, v54, v55, v56);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    objc_msgSend_wordLanguageModel(self->_languageResourceBundle, v57, v58, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_lmSPIType(v61, v62, v63, v64);

    if (v65 == 1)
    {
      v66 = (void *)objc_opt_class();
      objc_msgSend_applyWordLanguageModelProbabilityToPath_stemmedFromPath_isCommittingToken_(v66, v67, hasContext, (uint64_t)self, a8 != 0);
    }
  }
  v68 = v136;
  if (objc_msgSend_length(v68, v69, v70, v71) == 1)
  {
    v75 = objc_msgSend_characterAtIndex_(v68, v72, 0, v74);
  }
  else if (objc_msgSend_length(v68, v72, v73, v74) == 2)
  {
    v75 = objc_msgSend_characterAtIndex_(v68, v76, 0, v77);
    v80 = objc_msgSend_characterAtIndex_(v68, v78, 1, v79);
    if ((v80 & 0xFFF0) != 0xFE00)
      v75 = (v80 + ((_DWORD)v75 << 10) - 56613888);
  }
  else
  {
    v75 = 0xFFFFFFFFLL;
  }

  v81 = sub_1B035E210(v75);
  objc_msgSend_string(self, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v85, v86, v87, v88))
  {

    if ((v34 & 1) != 0)
      goto LABEL_34;
LABEL_33:
    objc_msgSend__updateCharacterLanguageModelLogProbabilityForString_stemmingFromPath_normalizedCodepoint_((void *)hasContext, v89, (uint64_t)v68, (uint64_t)self, v81);
    goto LABEL_34;
  }
  v90 = self->_hasContext;

  if (v90)
    v91 = v34;
  else
    v91 = 1;
  if ((v91 & 1) == 0)
    goto LABEL_33;
LABEL_34:
  objc_msgSend__updateLexiconLogProbabilityForString_stemmingFromPath_((void *)hasContext, v89, (uint64_t)v68, (uint64_t)self);
  *(_DWORD *)(hasContext + 284) = self->_lastCodeUnitType;
  *(_BYTE *)(hasContext + 281) = self->_hasProblematicMixedScriptWords;
  objc_msgSend_string((void *)hasContext, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string((void *)hasContext, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend_length(v99, v100, v101, v102);
  v106 = objc_msgSend_characterAtIndex_(v95, v104, v103 - 1, v105);
  sub_1B0360C24(v106, (_BYTE *)(hasContext + 281), (int *)(hasContext + 284), v107);

  *(_BYTE *)(hasContext + 282) = 1;
  if ((v34 & 1) == 0)
  {
    v108 = (void **)(hasContext + 80);
    v110 = *(char **)(hasContext + 88);
    v109 = *(_QWORD *)(hasContext + 96);
    if ((unint64_t)v110 < v109)
    {
      *(_DWORD *)v110 = v81;
      v111 = (uint64_t)(v110 + 4);
LABEL_56:
      *(_QWORD *)(hasContext + 88) = v111;
      goto LABEL_57;
    }
    v112 = (char *)*v108;
    v113 = v110 - (_BYTE *)*v108;
    v114 = v113 >> 2;
    v115 = (v113 >> 2) + 1;
    if (v115 >> 62)
      sub_1B02D7758();
    v116 = v109 - (_QWORD)v112;
    if (v116 >> 1 > v115)
      v115 = v116 >> 1;
    if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
      v117 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v117 = v115;
    if (v117)
    {
      if (v117 >> 62)
        sub_1B02D72AC();
      v118 = operator new(4 * v117);
      v119 = &v118[4 * v114];
      v120 = &v118[4 * v117];
      *v119 = v81;
      v111 = (uint64_t)(v119 + 1);
      v121 = v110 - v112;
      if (v110 == v112)
        goto LABEL_54;
    }
    else
    {
      v118 = 0;
      v119 = (_DWORD *)(4 * v114);
      v120 = 0;
      *(_DWORD *)(4 * v114) = v81;
      v111 = 4 * v114 + 4;
      v121 = v110 - v112;
      if (v110 == v112)
      {
LABEL_54:
        *v108 = v119;
        *(_QWORD *)(hasContext + 88) = v111;
        *(_QWORD *)(hasContext + 96) = v120;
        if (v112)
          operator delete(v112);
        goto LABEL_56;
      }
    }
    v122 = v121 - 4;
    if (v122 < 0x2C)
      goto LABEL_64;
    if ((unint64_t)(v110 - v118 - v113) < 0x20)
      goto LABEL_64;
    v123 = (v122 >> 2) + 1;
    v124 = 4 * (v123 & 0x7FFFFFFFFFFFFFF8);
    v125 = &v110[-v124];
    v119 = (_DWORD *)((char *)v119 - v124);
    v126 = &v118[4 * v114 - 16];
    v127 = v110 - 16;
    v128 = v123 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v129 = *(_OWORD *)v127;
      *(v126 - 1) = *((_OWORD *)v127 - 1);
      *v126 = v129;
      v126 -= 2;
      v127 -= 32;
      v128 -= 8;
    }
    while (v128);
    v110 = v125;
    if (v123 != (v123 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_64:
      do
      {
        v130 = *((_DWORD *)v110 - 1);
        v110 -= 4;
        *--v119 = v130;
      }
      while (v110 != v112);
    }
    goto LABEL_54;
  }
LABEL_57:

  return (id)hasContext;
}

- (void)_updateCharacterLanguageModelLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4 normalizedCodepoint:(unsigned int)a5
{
  _QWORD *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  float v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  __CFString *v43;

  v43 = (__CFString *)a3;
  v7 = a4;
  objc_msgSend_languageResourceBundle(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterLanguageModel(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v19 = objc_msgSend_lmSPIType(v15, v16, v17, v18);
    v23 = 0.0;
    if (v19 == 1)
    {
      v25 = objc_msgSend_length(v43, v20, v21, v22);
      if ((uint64_t)(v7[11] - v7[10]) >> 2 >= (unint64_t)objc_msgSend_requiredContextLengthForStringLength_(v15, v26, v25, v27))
      {
        objc_msgSend_languageModel(v15, v20, v21, v22);
        LMLanguageModelConditionalProbability();
        v23 = v28 * 2.30258509;
      }
    }
    else if (v19 == 2)
    {
      v24 = CVNLPLanguageModelWithStateConditionalProbability((uint64_t)self->_characterLMState, v43);
      v23 = logf(v24);
    }
    objc_msgSend_languageResourceBundle(self, v20, v21, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characterLanguageModel(v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowerBoundLogProbabilityValue(v33, v34, v35, v36);
    v38 = v37;

    objc_msgSend_characterLanguageModelLogProbability(v7, v39, v40, v41);
    self->super._characterLanguageModelLogProbability = fmin(v42 + fmax(v23, v38), 0.0);
  }

}

- (void)_updateLexiconLogProbabilityForString:(id)a3 stemmingFromPath:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  _BOOL4 v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  int isEqualToString;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  long double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(id);
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  CVNLPLexiconCursors *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t);
  void *v101;
  id v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  long double v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  __n128 (*v110)(__n128 *, __n128 *);
  void (*v111)(uint64_t);
  void *v112;
  void *__p;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  double *v121;
  uint64_t v122;
  uint64_t v123;

  v6 = a3;
  v7 = a4;
  if (CVNLPIsWordSeparatorForLexicon_0(v6))
  {
    objc_msgSend_historyLexiconLogProbability(v7, v8, v9, v10);
    v12 = v11;
    objc_msgSend_activeWordLexiconLogProbability(v7, v13, v14, v15);
    self->_historyLexiconLogProbability = v16 + v12;
    self->_activeWordLexiconLogProbability = 0.0;
    objc_msgSend_packagedLexiconRootCursors(self->_languageResourceBundle, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCursors_(self, v21, (uint64_t)v20, v22);

  }
  else
  {
    v120 = 0;
    v121 = (double *)&v120;
    v122 = 0x2020000000;
    v123 = 0;
    v23 = sub_1B0360818(v6);
    v24 = sub_1B03608A4(v6);
    isEqualToString = objc_msgSend_isEqualToString_(v6, v25, (uint64_t)CFSTR("'"), v26);
    v116 = 0;
    v117 = &v116;
    v118 = 0x2020000000;
    v119 = 0;
    objc_msgSend_cursors(v7, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v31, v32, v33, v34);

    if (v35 >= 1)
    {
      objc_msgSend_lexicons(self->_languageResourceBundle, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_count(v39, v40, v41, v42);
      v44 = log((double)(unint64_t)v43);

      v107 = 0;
      v108 = &v107;
      v109 = 0x4812000000;
      v110 = sub_1B036EFFC;
      v111 = sub_1B036F020;
      v112 = &unk_1B03B5E12;
      __p = 0;
      v114 = 0;
      v115 = 0;
      objc_msgSend_lexicons(self->_languageResourceBundle, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_inputNormalizationFunction(v48, v49, v50, v51))
      {
        objc_msgSend_lexicons(self->_languageResourceBundle, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void (*)(id))objc_msgSend_inputNormalizationFunction(v55, v56, v57, v58);
        v59(v6);
        v60 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v60 = v6;
      }

      objc_msgSend_cursors(v7, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = MEMORY[0x1E0C809B0];
      v99 = 3221225472;
      v100 = sub_1B036F038;
      v101 = &unk_1E60CE098;
      v65 = v60;
      v102 = v65;
      v103 = &v107;
      v104 = &v116;
      v105 = &v120;
      v106 = v44;
      objc_msgSend_enumerateLexiconCursorsSortedByPriorityWithBlock_(v64, v66, (uint64_t)&v98, v67);

      v68 = [CVNLPLexiconCursors alloc];
      v71 = (void *)objc_msgSend_initWithSortedCursors_(v68, v69, (uint64_t)(v108 + 6), v70, v98, v99, v100, v101);
      objc_msgSend_setCursors_(self, v72, (uint64_t)v71, v73);

      _Block_object_dispose(&v107, 8);
      if (__p)
      {
        v114 = __p;
        operator delete(__p);
      }
    }
    v74 = (v23 || v24) | isEqualToString;
    if ((v74 & 1) == 0)
      v121[3] = -2.99573227;
    objc_msgSend_languageResourceBundle(self, v36, v37, v38);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lexicons(v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowerBoundLogProbabilityValue(v79, v80, v81, v82);
    v84 = v83;

    if (v74 && !*((_BYTE *)v117 + 24))
    {
      objc_msgSend_activeWordLexiconLogProbability(v7, v85, v86, v87);
      if (v96 + -36.0436534 > v84)
      {
        objc_msgSend_activeWordLexiconLogProbability(v7, v89, v90, v91);
        v84 = v97 + -36.0436534;
      }
    }
    else
    {
      v88 = v121[3];
      objc_msgSend_activeWordLexiconLogProbability(v7, v85, v86, v87);
      if (v92 + v88 > v84)
      {
        v93 = v121[3];
        objc_msgSend_activeWordLexiconLogProbability(v7, v89, v90, v91);
        v84 = v94 + v93;
      }
    }
    self->_activeWordLexiconLogProbability = v84;
    objc_msgSend_historyLexiconLogProbability(v7, v89, v90, v91);
    self->_historyLexiconLogProbability = v95;
    _Block_object_dispose(&v116, 8);
    _Block_object_dispose(&v120, 8);
  }

}

+ (void)applyWordLanguageModelProbabilityToPath:(id)a3 stemmedFromPath:(id)a4 isCommittingToken:(BOOL)a5
{
  _BOOL4 v5;
  _QWORD *v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  int v36;
  char *v37;
  char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  float v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  int v68;
  _QWORD *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  _BYTE *v78;
  _DWORD *v79;
  uint64_t v80;
  int64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  _OWORD *v86;
  char *v87;
  uint64_t v88;
  __int128 v89;
  int v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  char *v97;
  _DWORD *v98;
  id v99;
  id v100;
  void *v101;
  _QWORD *v102;
  void *__p;
  void *v104;
  char *v105;
  void *v106;
  void *v107;
  _DWORD *v108;
  id v109[4];
  _QWORD block[4];
  id v111;
  id v112;
  uint64_t *v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  int v118;
  _QWORD v119[4];
  _QWORD v120[3];

  v5 = a5;
  v120[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v102 = v7;
  objc_msgSend_languageResourceBundle(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wordLanguageModel(v12, v13, v14, v15);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
    sub_1B03445E4(v7 + 13, (char *)v8[13], (char *)v8[14], (uint64_t)(v8[14] - v8[13]) >> 2);
  if (v101 && v5)
  {
    objc_msgSend_string(v8, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_length(v19, v20, v21, v22) - *((_DWORD *)v8 + 32);

    if ((int)v23 < 1)
    {
      objc_msgSend_wordLanguageModelLogProbability(v8, v24, v25, v26);
      objc_msgSend_setWordLanguageModelLogProbability_(v7, v49, v50, v51);
    }
    else
    {
      v27 = v8[16];
      objc_msgSend_string(v8, v24, v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringWithRange_(v28, v29, v27, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v119[0] = 0;
      v119[1] = v119;
      v119[2] = 0x2020000000;
      v119[3] = 0;
      v115 = 0;
      v116 = &v115;
      v117 = 0x2020000000;
      v118 = 0;
      objc_msgSend__getQueue(CVNLPCTCTextDecodingPath, v31, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B036F93C;
      block[3] = &unk_1E60CE0C0;
      v113 = &v115;
      v35 = v101;
      v111 = v35;
      v100 = v30;
      v112 = v100;
      v114 = v119;
      v95 = v34;
      dispatch_sync(v34, block);
      v36 = *((_DWORD *)v116 + 6);
      v98 = operator new(4uLL);
      *v98 = v36;
      v37 = (char *)operator new(4uLL);
      *(_DWORD *)v37 = v36;
      v38 = v37 + 4;
      objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v39, 0, v23);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v40;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v120, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v42;
      v45 = v43;
      if (*((_DWORD *)v116 + 6))
      {
        v99 = v43;
      }
      else
      {
        v109[0] = v43;
        objc_msgSend_wordTokenIDsForString_outTokenRanges_(v35, v44, (uint64_t)v100, (uint64_t)v109);
        v99 = v109[0];

        operator delete(v37);
        v37 = (char *)v109[1];
        v38 = (char *)v109[2];
      }
      v107 = 0;
      v108 = 0;
      v97 = v37;
      v96 = v45;
      v55 = operator new(4uLL);
      v105 = 0;
      v106 = v55;
      *v55 = *v98;
      v107 = v55 + 1;
      v108 = v55 + 1;
      __p = 0;
      v104 = 0;
      v57 = v38 - v37;
      if (v38 != v37)
      {
        if (v57 < 0)
          sub_1B02D7758();
        __p = operator new(v38 - v37);
        v105 = (char *)__p + 4 * (v57 >> 2);
        memcpy(__p, v37, v38 - v37);
        v104 = v105;
      }
      objc_msgSend__wordLanguageModelLogProbabilityForString_originalWordRanges_originalWordIDs_wordRanges_wordIDs_(v8, v56, (uint64_t)v100, (uint64_t)v45, &v106, v99, &__p);
      v62 = v61;
      if (__p)
      {
        v104 = __p;
        operator delete(__p);
      }
      if (v106)
      {
        v107 = v106;
        operator delete(v106);
      }
      objc_msgSend_wordLanguageModelLogProbability(v8, v58, v59, v60);
      objc_msgSend_setWordLanguageModelLogProbability_(v7, v64, v65, v66, v63 + v62);
      if (v38 != v37)
      {
        v67 = v37;
        while (1)
        {
          while (1)
          {
            v69 = v7 + 13;
            v71 = (char *)v7[14];
            v70 = v7[15];
            if ((unint64_t)v71 >= v70)
              break;
            v68 = *(_DWORD *)v67;
            v67 += 4;
            *(_DWORD *)v71 = v68;
            v7[14] = v71 + 4;
            if (v67 == v38)
              goto LABEL_42;
          }
          v72 = (char *)*v69;
          v73 = (uint64_t)&v71[-*v69];
          v74 = v73 >> 2;
          v75 = (v73 >> 2) + 1;
          if (v75 >> 62)
            sub_1B02D7758();
          v76 = v70 - (_QWORD)v72;
          if (v76 >> 1 > v75)
            v75 = v76 >> 1;
          v77 = (unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v75;
          if (v77)
            break;
          v78 = 0;
          v79 = (_DWORD *)(4 * v74);
          *(_DWORD *)(4 * v74) = *(_DWORD *)v67;
          v80 = 4 * v74 + 4;
          v81 = v71 - v72;
          if (v71 != v72)
            goto LABEL_33;
LABEL_39:
          *v69 = v79;
          v69[1] = v80;
          v69[2] = &v78[4 * v77];
          if (v72)
            operator delete(v72);
          v7 = v102;
          v69[1] = v80;
          v67 += 4;
          if (v67 == v38)
            goto LABEL_42;
        }
        if (v77 >> 62)
          sub_1B02D72AC();
        v78 = operator new(4 * v77);
        v79 = &v78[4 * v74];
        *v79 = *(_DWORD *)v67;
        v80 = (uint64_t)(v79 + 1);
        v81 = v71 - v72;
        if (v71 == v72)
          goto LABEL_39;
LABEL_33:
        v82 = v81 - 4;
        if (v82 < 0x2C)
          goto LABEL_52;
        if ((unint64_t)(v71 - v78 - v73) < 0x20)
          goto LABEL_52;
        v83 = (v82 >> 2) + 1;
        v84 = 4 * (v83 & 0x7FFFFFFFFFFFFFF8);
        v85 = &v71[-v84];
        v79 = (_DWORD *)((char *)v79 - v84);
        v86 = &v78[4 * v74 - 16];
        v87 = v71 - 16;
        v88 = v83 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v89 = *(_OWORD *)v87;
          *(v86 - 1) = *((_OWORD *)v87 - 1);
          *v86 = v89;
          v86 -= 2;
          v87 -= 32;
          v88 -= 8;
        }
        while (v88);
        v71 = v85;
        if (v83 != (v83 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_52:
          do
          {
            v90 = *((_DWORD *)v71 - 1);
            v71 -= 4;
            *--v79 = v90;
          }
          while (v71 != v72);
        }
        goto LABEL_39;
      }
LABEL_42:

      if (v97)
        operator delete(v97);
      operator delete(v98);

      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(v119, 8);

    }
    objc_msgSend_string(v8, v52, v53, v54);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v7[16] = objc_msgSend_length(v91, v92, v93, v94) + 1;

  }
  else
  {
    objc_msgSend_wordLanguageModelLogProbability(v8, v16, v17, v18);
    objc_msgSend_setWordLanguageModelLogProbability_(v7, v46, v47, v48);
    v7[16] = v8[16];
  }

}

- (float)_wordLanguageModelLogProbabilityForString:(id)a3 originalWordRanges:(id)a4 originalWordIDs:(vector<unsigned)int wordRanges:(std:(id)a6 :(vector<unsigned)int allocator<unsigned int>> *)a5 wordIDs:(std::allocator<unsigned int>> *)a7
{
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *end;
  unsigned int *begin;
  int64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  float v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int *v44;
  int64_t v45;
  char *v46;
  char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  char *v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _BYTE *v59;
  unsigned int *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _OWORD *v66;
  char *v67;
  uint64_t v68;
  __int128 v69;
  unsigned int v70;
  double v71;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  id v85;
  id v87;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  NSObject *queue;
  _QWORD block[6];
  void *__p;
  void *v95;
  char *v96;
  unsigned int v97;
  uint64_t v98;
  double *v99;
  uint64_t v100;
  uint64_t v101;
  unsigned int *v102;
  char *v103;
  char *v104;

  v10 = a3;
  v85 = a4;
  v13 = a6;
  if (qword_1EEEB2900 != -1)
    dispatch_once(&qword_1EEEB2900, &unk_1E60CDB28);
  objc_msgSend_objectAtIndexedSubscript_(v85, v11, 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_rangeValue(v14, v15, v16, v17);
  v89 = v18;

  v103 = 0;
  v104 = 0;
  v102 = 0;
  begin = self->_histWordTokenIDs.__begin_;
  end = self->_histWordTokenIDs.__end_;
  v24 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v24 < 0)
      sub_1B02D7758();
    v25 = (char *)operator new((char *)end - (char *)begin);
    v26 = &v25[4 * (v24 >> 2)];
    v102 = (unsigned int *)v25;
    v104 = v26;
    memcpy(v25, begin, v24);
    v103 = v26;
  }
  v27 = 0;
  v28 = 0.0;
  v87 = v13;
  while (v27 < objc_msgSend_count(v13, v19, v20, v21))
  {
    objc_msgSend_objectAtIndexedSubscript_(v13, v29, v27, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_rangeValue(v31, v32, v33, v34);
    v37 = v36;

    v42 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v10, v38, qword_1EEEB28F0, 2, v35, v37);
    if (v35 != v90 || v37 != v89 || (v43 = *a5->__begin_) == 0)
      v43 = a7->__begin_[v27];
    v98 = 0;
    v99 = (double *)&v98;
    v100 = 0x2020000000;
    v101 = 0;
    objc_msgSend__getQueue(CVNLPCTCTextDecodingPath, v39, v40, v41);
    queue = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = sub_1B0370038;
    block[3] = &unk_1E60CDA18;
    block[4] = self;
    block[5] = &v98;
    v97 = v43;
    v95 = 0;
    v96 = 0;
    __p = 0;
    v44 = v102;
    v45 = v103 - (char *)v102;
    if (v103 != (char *)v102)
    {
      if (v45 < 0)
        sub_1B02D7758();
      v46 = (char *)operator new(v103 - (char *)v102);
      v47 = &v46[4 * (v45 >> 2)];
      __p = v46;
      v96 = v47;
      memcpy(v46, v44, v45);
      v95 = v47;
    }
    v91 = v27;
    dispatch_sync(queue, block);
    v51 = v99[3];
    v52 = v103;
    if (v103 < v104)
    {
      *(_DWORD *)v103 = v43;
      v53 = (uint64_t)(v52 + 4);
      goto LABEL_39;
    }
    v54 = v102;
    v55 = (v103 - (char *)v102) >> 2;
    v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 62)
      sub_1B02D7758();
    v57 = v104 - (char *)v102;
    if ((v104 - (char *)v102) >> 1 > v56)
      v56 = v57 >> 1;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL)
      v58 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v58 = v56;
    if (v58)
    {
      if (v58 >> 62)
        sub_1B02D72AC();
      v59 = operator new(4 * v58);
      v60 = (unsigned int *)&v59[4 * v55];
      *v60 = v43;
      v53 = (uint64_t)(v60 + 1);
      v61 = v52 - (char *)v54;
      if (v52 == (char *)v54)
        goto LABEL_36;
LABEL_27:
      v62 = v61 - 4;
      if (v62 < 0x2C)
        goto LABEL_58;
      if ((unint64_t)((char *)v54 - v59) < 0x20)
        goto LABEL_58;
      v63 = (v62 >> 2) + 1;
      v64 = 4 * (v63 & 0x7FFFFFFFFFFFFFF8);
      v65 = &v52[-v64];
      v60 = (unsigned int *)((char *)v60 - v64);
      v66 = &v59[4 * v55 - 16];
      v67 = v52 - 16;
      v68 = v63 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v69 = *(_OWORD *)v67;
        *(v66 - 1) = *((_OWORD *)v67 - 1);
        *v66 = v69;
        v66 -= 2;
        v67 -= 32;
        v68 -= 8;
      }
      while (v68);
      v52 = v65;
      if (v63 != (v63 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_58:
        do
        {
          v70 = *((_DWORD *)v52 - 1);
          v52 -= 4;
          *--v60 = v70;
        }
        while (v52 != (char *)v54);
      }
      goto LABEL_36;
    }
    v59 = 0;
    v60 = (unsigned int *)(4 * v55);
    *(_DWORD *)(4 * v55) = v43;
    v53 = 4 * v55 + 4;
    v61 = v52 - (char *)v54;
    if (v52 != (char *)v54)
      goto LABEL_27;
LABEL_36:
    v102 = v60;
    v103 = (char *)v53;
    v104 = &v59[4 * v58];
    if (v54)
      operator delete(v54);
    v13 = v87;
LABEL_39:
    v71 = v51 * 2.30258509;
    if (v51 * 2.30258509 > 0.0)
      v71 = -5.0;
    v103 = (char *)v53;
    if (v42 == 0x7FFFFFFFFFFFFFFFLL && v43 == 0)
      v73 = -36.044667;
    else
      v73 = v71;
    objc_msgSend_languageResourceBundle(self, v48, v49, v50, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_wordLanguageModel(v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowerBoundLogProbabilityValue(v78, v79, v80, v81);
    v83 = v82;

    if (__p)
    {
      v95 = __p;
      operator delete(__p);
    }
    v28 = fmax(v73, v83) + v28;

    _Block_object_dispose(&v98, 8);
    v27 = v91 + 1;
  }
  if (v102)
  {
    v103 = (char *)v102;
    operator delete(v102);
  }

  return v28;
}

+ (id)_getQueue
{
  if (qword_1EEEB2908 != -1)
    dispatch_once(&qword_1EEEB2908, &unk_1E60CE0E0);
  return (id)qword_1EEEB2910;
}

- (double)blankLogProbability
{
  return self->_blankLogProbability;
}

- (void)setBlankLogProbability:(double)a3
{
  self->_blankLogProbability = a3;
}

- (double)nonBlankLogProbability
{
  return self->_nonBlankLogProbability;
}

- (void)setNonBlankLogProbability:(double)a3
{
  self->_nonBlankLogProbability = a3;
}

- (double)historyLexiconLogProbability
{
  return self->_historyLexiconLogProbability;
}

- (void)setHistoryLexiconLogProbability:(double)a3
{
  self->_historyLexiconLogProbability = a3;
}

- (double)activeWordLexiconLogProbability
{
  return self->_activeWordLexiconLogProbability;
}

- (void)setActiveWordLexiconLogProbability:(double)a3
{
  self->_activeWordLexiconLogProbability = a3;
}

- (double)languageResourceLogProbability
{
  return self->_languageResourceLogProbability;
}

- (BOOL)optimizingAlignment
{
  return self->_optimizingAlignment;
}

- (CVNLPLexiconCursors)cursors
{
  return self->_cursors;
}

- (void)setCursors:(id)a3
{
  objc_storeStrong((id *)&self->_cursors, a3);
}

- (CVNLPLanguageModelWithState)characterLMState
{
  return self->_characterLMState;
}

- (CVNLPLanguageResourceBundle)languageResourceBundle
{
  return self->_languageResourceBundle;
}

- (id)scoringFunction
{
  return self->_scoringFunction;
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  unint64_t *v5;
  double *v6;
  double *v7;
  unsigned int *v8;
  unsigned int *v9;

  objc_storeStrong((id *)&self->_languageResourceBundle, 0);
  objc_storeStrong((id *)&self->_cursors, 0);
  objc_storeStrong((id *)&self->_latestExpandedSymbolIncludingPseudospace, 0);
  begin = self->_tokenCommitCharacterLengths.__begin_;
  if (begin)
  {
    self->_tokenCommitCharacterLengths.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_tokenMaxActivations.__begin_;
  if (v4)
  {
    self->_tokenMaxActivations.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_tokenStringSegmentationPositions.__begin_;
  if (v5)
  {
    self->_tokenStringSegmentationPositions.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_tokenBoundaryLogProbabilities.__begin_;
  if (v6)
  {
    self->_tokenBoundaryLogProbabilities.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_cumulativeTokenLogProbabilities.__begin_;
  if (v7)
  {
    self->_cumulativeTokenLogProbabilities.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_histWordTokenIDs.__begin_;
  if (v8)
  {
    self->_histWordTokenIDs.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_tokenString.__begin_;
  if (v9)
  {
    self->_tokenString.__end_ = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 29) = 0;
  return self;
}

@end
