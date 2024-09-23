@implementation _CPMailRankingSignalsForFeedback

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPMailRankingSignalsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[_CPMailRankingSignalsForFeedback wasReorderedByRecency](self, "wasReorderedByRecency"))
    PBDataWriterWriteBOOLField();
  if (-[_CPMailRankingSignalsForFeedback numEngagements](self, "numEngagements"))
    PBDataWriterWriteUint64Field();
  if (-[_CPMailRankingSignalsForFeedback numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"))
    PBDataWriterWriteUint64Field();
  if (-[_CPMailRankingSignalsForFeedback averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMailRankingSignalsForFeedback averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMailRankingSignalsForFeedback averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMailRankingSignalsForFeedback averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days"))
    PBDataWriterWriteInt32Field();
  if (-[_CPMailRankingSignalsForFeedback daysSinceReceipt](self, "daysSinceReceipt"))
    PBDataWriterWriteUint64Field();
  -[_CPMailRankingSignalsForFeedback l1Score](self, "l1Score");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPMailRankingSignalsForFeedback l2Score](self, "l2Score");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPMailRankingSignalsForFeedback isFlagged](self, "isFlagged"))
    PBDataWriterWriteBOOLField();
  if (-[_CPMailRankingSignalsForFeedback isRepliedTo](self, "isRepliedTo"))
    PBDataWriterWriteBOOLField();
  if (-[_CPMailRankingSignalsForFeedback isSemanticMatch](self, "isSemanticMatch"))
    PBDataWriterWriteBOOLField();
  if (-[_CPMailRankingSignalsForFeedback isSyntacticMatch](self, "isSyntacticMatch"))
    PBDataWriterWriteBOOLField();
  -[_CPMailRankingSignalsForFeedback semanticScore](self, "semanticScore");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPMailRankingSignalsForFeedback syntacticScore](self, "syntacticScore");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInAuthors](self, "countBigramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInAuthors](self, "countNgramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInSubject](self, "countUnigramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInSubject](self, "countBigramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInSubject](self, "countNgramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInTextContent](self, "countBigramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInTextContent](self, "countNgramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInRecipients](self, "countBigramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInRecipients](self, "countNgramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"))
    PBDataWriterWriteUint32Field();
  if (-[_CPMailRankingSignalsForFeedback countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_CPMailRankingSignalsForFeedback countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"))
  {
    PBDataWriterWriteUint32Field();
  }
  v8 = -[_CPMailRankingSignalsForFeedback countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames");
  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteUint32Field();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int wasReorderedByRecency;
  unint64_t numEngagements;
  unint64_t numDaysEngagedLast30Days;
  int averageEngagementAgeLast7Days;
  int averageEngagementAgeLast14Days;
  int averageEngagementAgeLast21Days;
  int averageEngagementAgeLast30Days;
  unint64_t daysSinceReceipt;
  float l1Score;
  float v14;
  float l2Score;
  float v16;
  int isFlagged;
  int isRepliedTo;
  int isSemanticMatch;
  int isSyntacticMatch;
  float semanticScore;
  float v22;
  float syntacticScore;
  float v24;
  unsigned int countUnigramMatchInAuthors;
  unsigned int countBigramMatchInAuthors;
  unsigned int countNgramMatchInAuthors;
  unsigned int countUnigramPrefixMatchInAuthors;
  unsigned int countBigramPrefixMatchInAuthors;
  unsigned int countNgramPrefixMatchInAuthors;
  unsigned int countUnigramMatchInAuthorEmailAddresses;
  unsigned int countBigramMatchInAuthorEmailAddresses;
  unsigned int countNgramMatchInAuthorEmailAddresses;
  unsigned int countUnigramPrefixMatchInAuthorEmailAddresses;
  unsigned int countBigramPrefixMatchInAuthorEmailAddresses;
  unsigned int countNgramPrefixMatchInAuthorEmailAddresses;
  unsigned int countUnigramMatchInSubject;
  unsigned int countBigramMatchInSubject;
  unsigned int countNgramMatchInSubject;
  unsigned int countUnigramPrefixMatchInSubject;
  unsigned int countBigramPrefixMatchInSubject;
  unsigned int countNgramPrefixMatchInSubject;
  unsigned int countUnigramMatchInTextContent;
  unsigned int countBigramMatchInTextContent;
  unsigned int countNgramMatchInTextContent;
  unsigned int countUnigramPrefixMatchInTextContent;
  unsigned int countBigramPrefixMatchInTextContent;
  unsigned int countNgramPrefixMatchInTextContent;
  unsigned int countUnigramMatchInRecipients;
  unsigned int countBigramMatchInRecipients;
  unsigned int countNgramMatchInRecipients;
  unsigned int countUnigramPrefixMatchInRecipients;
  unsigned int countBigramPrefixMatchInRecipients;
  unsigned int countNgramPrefixMatchInRecipients;
  unsigned int countUnigramMatchInRecipientEmailAddresses;
  unsigned int countBigramMatchInRecipientEmailAddresses;
  unsigned int countNgramMatchInRecipientEmailAddresses;
  unsigned int countUnigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countBigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countNgramPrefixMatchInRecipientEmailAddresses;
  unsigned int countUnigramMatchInEmailAddresses;
  unsigned int countBigramMatchInEmailAddresses;
  unsigned int countNgramMatchInEmailAddresses;
  unsigned int countUnigramPrefixMatchInEmailAddresses;
  unsigned int countBigramPrefixMatchInEmailAddresses;
  unsigned int countNgramPrefixMatchInEmailAddresses;
  unsigned int countUnigramMatchInAttachmentTypes;
  unsigned int countBigramMatchInAttachmentTypes;
  unsigned int countNgramMatchInAttachmentTypes;
  unsigned int countUnigramPrefixMatchInAttachmentTypes;
  unsigned int countBigramPrefixMatchInAttachmentTypes;
  unsigned int countNgramPrefixMatchInAttachmentTypes;
  unsigned int countUnigramMatchInAttachmentNames;
  unsigned int countBigramMatchInAttachmentNames;
  unsigned int countNgramMatchInAttachmentNames;
  unsigned int countUnigramPrefixMatchInAttachmentNames;
  unsigned int countBigramPrefixMatchInAttachmentNames;
  unsigned int countNgramPrefixMatchInAttachmentNames;
  BOOL v79;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  wasReorderedByRecency = self->_wasReorderedByRecency;
  if (wasReorderedByRecency != objc_msgSend(v4, "wasReorderedByRecency"))
    goto LABEL_72;
  numEngagements = self->_numEngagements;
  if (numEngagements != objc_msgSend(v4, "numEngagements"))
    goto LABEL_72;
  numDaysEngagedLast30Days = self->_numDaysEngagedLast30Days;
  if (numDaysEngagedLast30Days != objc_msgSend(v4, "numDaysEngagedLast30Days"))
    goto LABEL_72;
  averageEngagementAgeLast7Days = self->_averageEngagementAgeLast7Days;
  if (averageEngagementAgeLast7Days != objc_msgSend(v4, "averageEngagementAgeLast7Days"))
    goto LABEL_72;
  averageEngagementAgeLast14Days = self->_averageEngagementAgeLast14Days;
  if (averageEngagementAgeLast14Days != objc_msgSend(v4, "averageEngagementAgeLast14Days"))
    goto LABEL_72;
  averageEngagementAgeLast21Days = self->_averageEngagementAgeLast21Days;
  if (averageEngagementAgeLast21Days != objc_msgSend(v4, "averageEngagementAgeLast21Days"))
    goto LABEL_72;
  averageEngagementAgeLast30Days = self->_averageEngagementAgeLast30Days;
  if (averageEngagementAgeLast30Days != objc_msgSend(v4, "averageEngagementAgeLast30Days"))
    goto LABEL_72;
  daysSinceReceipt = self->_daysSinceReceipt;
  if (daysSinceReceipt != objc_msgSend(v4, "daysSinceReceipt"))
    goto LABEL_72;
  l1Score = self->_l1Score;
  objc_msgSend(v4, "l1Score");
  if (l1Score != v14)
    goto LABEL_72;
  l2Score = self->_l2Score;
  objc_msgSend(v4, "l2Score");
  if (l2Score != v16)
    goto LABEL_72;
  isFlagged = self->_isFlagged;
  if (isFlagged != objc_msgSend(v4, "isFlagged"))
    goto LABEL_72;
  isRepliedTo = self->_isRepliedTo;
  if (isRepliedTo != objc_msgSend(v4, "isRepliedTo"))
    goto LABEL_72;
  isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch != objc_msgSend(v4, "isSemanticMatch"))
    goto LABEL_72;
  isSyntacticMatch = self->_isSyntacticMatch;
  if (isSyntacticMatch != objc_msgSend(v4, "isSyntacticMatch"))
    goto LABEL_72;
  semanticScore = self->_semanticScore;
  objc_msgSend(v4, "semanticScore");
  if (semanticScore != v22)
    goto LABEL_72;
  syntacticScore = self->_syntacticScore;
  objc_msgSend(v4, "syntacticScore");
  if (syntacticScore != v24)
    goto LABEL_72;
  countUnigramMatchInAuthors = self->_countUnigramMatchInAuthors;
  if (countUnigramMatchInAuthors != objc_msgSend(v4, "countUnigramMatchInAuthors"))
    goto LABEL_72;
  countBigramMatchInAuthors = self->_countBigramMatchInAuthors;
  if (countBigramMatchInAuthors != objc_msgSend(v4, "countBigramMatchInAuthors"))
    goto LABEL_72;
  countNgramMatchInAuthors = self->_countNgramMatchInAuthors;
  if (countNgramMatchInAuthors != objc_msgSend(v4, "countNgramMatchInAuthors"))
    goto LABEL_72;
  countUnigramPrefixMatchInAuthors = self->_countUnigramPrefixMatchInAuthors;
  if (countUnigramPrefixMatchInAuthors != objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"))
    goto LABEL_72;
  countBigramPrefixMatchInAuthors = self->_countBigramPrefixMatchInAuthors;
  if (countBigramPrefixMatchInAuthors != objc_msgSend(v4, "countBigramPrefixMatchInAuthors"))
    goto LABEL_72;
  countNgramPrefixMatchInAuthors = self->_countNgramPrefixMatchInAuthors;
  if (countNgramPrefixMatchInAuthors != objc_msgSend(v4, "countNgramPrefixMatchInAuthors"))
    goto LABEL_72;
  countUnigramMatchInAuthorEmailAddresses = self->_countUnigramMatchInAuthorEmailAddresses;
  if (countUnigramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"))goto LABEL_72;
  countBigramMatchInAuthorEmailAddresses = self->_countBigramMatchInAuthorEmailAddresses;
  if (countBigramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"))goto LABEL_72;
  countNgramMatchInAuthorEmailAddresses = self->_countNgramMatchInAuthorEmailAddresses;
  if (countNgramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"))
    goto LABEL_72;
  countUnigramPrefixMatchInAuthorEmailAddresses = self->_countUnigramPrefixMatchInAuthorEmailAddresses;
  if (countUnigramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInAuthorEmailAddresses = self->_countBigramPrefixMatchInAuthorEmailAddresses;
  if (countBigramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInAuthorEmailAddresses = self->_countNgramPrefixMatchInAuthorEmailAddresses;
  if (countNgramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countUnigramMatchInSubject = self->_countUnigramMatchInSubject;
  if (countUnigramMatchInSubject != objc_msgSend(v4, "countUnigramMatchInSubject"))
    goto LABEL_72;
  countBigramMatchInSubject = self->_countBigramMatchInSubject;
  if (countBigramMatchInSubject != objc_msgSend(v4, "countBigramMatchInSubject"))
    goto LABEL_72;
  countNgramMatchInSubject = self->_countNgramMatchInSubject;
  if (countNgramMatchInSubject != objc_msgSend(v4, "countNgramMatchInSubject"))
    goto LABEL_72;
  countUnigramPrefixMatchInSubject = self->_countUnigramPrefixMatchInSubject;
  if (countUnigramPrefixMatchInSubject != objc_msgSend(v4, "countUnigramPrefixMatchInSubject"))
    goto LABEL_72;
  countBigramPrefixMatchInSubject = self->_countBigramPrefixMatchInSubject;
  if (countBigramPrefixMatchInSubject != objc_msgSend(v4, "countBigramPrefixMatchInSubject"))
    goto LABEL_72;
  countNgramPrefixMatchInSubject = self->_countNgramPrefixMatchInSubject;
  if (countNgramPrefixMatchInSubject != objc_msgSend(v4, "countNgramPrefixMatchInSubject"))
    goto LABEL_72;
  countUnigramMatchInTextContent = self->_countUnigramMatchInTextContent;
  if (countUnigramMatchInTextContent != objc_msgSend(v4, "countUnigramMatchInTextContent"))
    goto LABEL_72;
  countBigramMatchInTextContent = self->_countBigramMatchInTextContent;
  if (countBigramMatchInTextContent != objc_msgSend(v4, "countBigramMatchInTextContent"))
    goto LABEL_72;
  countNgramMatchInTextContent = self->_countNgramMatchInTextContent;
  if (countNgramMatchInTextContent != objc_msgSend(v4, "countNgramMatchInTextContent"))
    goto LABEL_72;
  countUnigramPrefixMatchInTextContent = self->_countUnigramPrefixMatchInTextContent;
  if (countUnigramPrefixMatchInTextContent != objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"))
    goto LABEL_72;
  countBigramPrefixMatchInTextContent = self->_countBigramPrefixMatchInTextContent;
  if (countBigramPrefixMatchInTextContent != objc_msgSend(v4, "countBigramPrefixMatchInTextContent"))
    goto LABEL_72;
  countNgramPrefixMatchInTextContent = self->_countNgramPrefixMatchInTextContent;
  if (countNgramPrefixMatchInTextContent != objc_msgSend(v4, "countNgramPrefixMatchInTextContent"))
    goto LABEL_72;
  countUnigramMatchInRecipients = self->_countUnigramMatchInRecipients;
  if (countUnigramMatchInRecipients != objc_msgSend(v4, "countUnigramMatchInRecipients"))
    goto LABEL_72;
  countBigramMatchInRecipients = self->_countBigramMatchInRecipients;
  if (countBigramMatchInRecipients != objc_msgSend(v4, "countBigramMatchInRecipients"))
    goto LABEL_72;
  countNgramMatchInRecipients = self->_countNgramMatchInRecipients;
  if (countNgramMatchInRecipients != objc_msgSend(v4, "countNgramMatchInRecipients"))
    goto LABEL_72;
  countUnigramPrefixMatchInRecipients = self->_countUnigramPrefixMatchInRecipients;
  if (countUnigramPrefixMatchInRecipients != objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"))
    goto LABEL_72;
  countBigramPrefixMatchInRecipients = self->_countBigramPrefixMatchInRecipients;
  if (countBigramPrefixMatchInRecipients != objc_msgSend(v4, "countBigramPrefixMatchInRecipients"))
    goto LABEL_72;
  countNgramPrefixMatchInRecipients = self->_countNgramPrefixMatchInRecipients;
  if (countNgramPrefixMatchInRecipients != objc_msgSend(v4, "countNgramPrefixMatchInRecipients"))
    goto LABEL_72;
  countUnigramMatchInRecipientEmailAddresses = self->_countUnigramMatchInRecipientEmailAddresses;
  if (countUnigramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countBigramMatchInRecipientEmailAddresses = self->_countBigramMatchInRecipientEmailAddresses;
  if (countBigramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countNgramMatchInRecipientEmailAddresses = self->_countNgramMatchInRecipientEmailAddresses;
  if (countNgramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countUnigramPrefixMatchInRecipientEmailAddresses = self->_countUnigramPrefixMatchInRecipientEmailAddresses;
  if (countUnigramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInRecipientEmailAddresses = self->_countBigramPrefixMatchInRecipientEmailAddresses;
  if (countBigramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInRecipientEmailAddresses = self->_countNgramPrefixMatchInRecipientEmailAddresses;
  if (countNgramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countUnigramMatchInEmailAddresses = self->_countUnigramMatchInEmailAddresses;
  if (countUnigramMatchInEmailAddresses != objc_msgSend(v4, "countUnigramMatchInEmailAddresses"))
    goto LABEL_72;
  countBigramMatchInEmailAddresses = self->_countBigramMatchInEmailAddresses;
  if (countBigramMatchInEmailAddresses != objc_msgSend(v4, "countBigramMatchInEmailAddresses"))
    goto LABEL_72;
  countNgramMatchInEmailAddresses = self->_countNgramMatchInEmailAddresses;
  if (countNgramMatchInEmailAddresses != objc_msgSend(v4, "countNgramMatchInEmailAddresses"))
    goto LABEL_72;
  countUnigramPrefixMatchInEmailAddresses = self->_countUnigramPrefixMatchInEmailAddresses;
  if (countUnigramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInEmailAddresses = self->_countBigramPrefixMatchInEmailAddresses;
  if (countBigramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInEmailAddresses = self->_countNgramPrefixMatchInEmailAddresses;
  if (countNgramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"))
    goto LABEL_72;
  countUnigramMatchInAttachmentTypes = self->_countUnigramMatchInAttachmentTypes;
  if (countUnigramMatchInAttachmentTypes != objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"))
    goto LABEL_72;
  countBigramMatchInAttachmentTypes = self->_countBigramMatchInAttachmentTypes;
  if (countBigramMatchInAttachmentTypes != objc_msgSend(v4, "countBigramMatchInAttachmentTypes"))
    goto LABEL_72;
  countNgramMatchInAttachmentTypes = self->_countNgramMatchInAttachmentTypes;
  if (countNgramMatchInAttachmentTypes != objc_msgSend(v4, "countNgramMatchInAttachmentTypes"))
    goto LABEL_72;
  countUnigramPrefixMatchInAttachmentTypes = self->_countUnigramPrefixMatchInAttachmentTypes;
  if (countUnigramPrefixMatchInAttachmentTypes != objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"))goto LABEL_72;
  countBigramPrefixMatchInAttachmentTypes = self->_countBigramPrefixMatchInAttachmentTypes;
  if (countBigramPrefixMatchInAttachmentTypes == objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes")&& (countNgramPrefixMatchInAttachmentTypes = self->_countNgramPrefixMatchInAttachmentTypes, countNgramPrefixMatchInAttachmentTypes == objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"))&& (countUnigramMatchInAttachmentNames = self->_countUnigramMatchInAttachmentNames, countUnigramMatchInAttachmentNames == objc_msgSend(v4, "countUnigramMatchInAttachmentNames"))&& (countBigramMatchInAttachmentNames = self->_countBigramMatchInAttachmentNames, countBigramMatchInAttachmentNames == objc_msgSend(v4, "countBigramMatchInAttachmentNames"))&& (countNgramMatchInAttachmentNames = self->_countNgramMatchInAttachmentNames, countNgramMatchInAttachmentNames == objc_msgSend(v4, "countNgramMatchInAttachmentNames"))&& (countUnigramPrefixMatchInAttachmentNames = self->_countUnigramPrefixMatchInAttachmentNames, countUnigramPrefixMatchInAttachmentNames == objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"))&& (countBigramPrefixMatchInAttachmentNames = self->_countBigramPrefixMatchInAttachmentNames, countBigramPrefixMatchInAttachmentNames == objc_msgSend(v4,
                                                                   "countBigramPrefixMatchInAttachmentNames")))
  {
    countNgramPrefixMatchInAttachmentNames = self->_countNgramPrefixMatchInAttachmentNames;
    v79 = countNgramPrefixMatchInAttachmentNames == objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames");
  }
  else
  {
LABEL_72:
    v79 = 0;
  }

  return v79;
}

- (unint64_t)hash
{
  float l1Score;
  double v4;
  long double v5;
  float l2Score;
  double v7;
  long double v8;
  float semanticScore;
  double v10;
  long double v11;
  float syntacticScore;
  double v13;
  long double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  unsigned int countUnigramPrefixMatchInAttachmentNames;
  unsigned int countNgramMatchInAttachmentNames;
  unsigned int countBigramMatchInAttachmentNames;
  unsigned int countUnigramMatchInAttachmentNames;
  unsigned int countNgramPrefixMatchInAttachmentTypes;
  unsigned int countBigramPrefixMatchInAttachmentTypes;
  unsigned int countUnigramPrefixMatchInAttachmentTypes;
  unsigned int countNgramMatchInAttachmentTypes;
  unsigned int countBigramMatchInAttachmentTypes;
  unsigned int countUnigramMatchInAttachmentTypes;
  unsigned int countNgramPrefixMatchInEmailAddresses;
  unsigned int countBigramPrefixMatchInEmailAddresses;
  unsigned int countUnigramPrefixMatchInEmailAddresses;
  unsigned int countNgramMatchInEmailAddresses;
  unsigned int countBigramMatchInEmailAddresses;
  unsigned int countUnigramMatchInEmailAddresses;
  unsigned int countNgramPrefixMatchInRecipientEmailAddresses;
  unsigned int countBigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countUnigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countNgramMatchInRecipientEmailAddresses;
  unsigned int countBigramMatchInRecipientEmailAddresses;
  unsigned int countUnigramMatchInRecipientEmailAddresses;
  unsigned int countNgramPrefixMatchInRecipients;
  unsigned int countBigramPrefixMatchInRecipients;
  unsigned int countUnigramPrefixMatchInRecipients;
  unsigned int countNgramMatchInRecipients;
  unsigned int countBigramMatchInRecipients;
  unsigned int countUnigramMatchInRecipients;
  unsigned int countNgramPrefixMatchInTextContent;
  unsigned int countBigramPrefixMatchInTextContent;
  unsigned int countUnigramPrefixMatchInTextContent;
  unsigned int countNgramMatchInTextContent;
  unsigned int countBigramMatchInTextContent;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;

  v78 = (2654435761u * self->_numEngagements) ^ (2654435761 * self->_wasReorderedByRecency) ^ (2654435761u
                                                                                               * self->_numDaysEngagedLast30Days) ^ (2654435761 * self->_averageEngagementAgeLast7Days) ^ (2654435761 * self->_averageEngagementAgeLast14Days) ^ (2654435761 * self->_averageEngagementAgeLast21Days) ^ (2654435761 * self->_averageEngagementAgeLast30Days);
  v77 = 2654435761u * self->_daysSinceReceipt;
  l1Score = self->_l1Score;
  v4 = l1Score;
  if (l1Score < 0.0)
    v4 = -l1Score;
  v5 = round(v4);
  v76 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  l2Score = self->_l2Score;
  v7 = l2Score;
  if (l2Score < 0.0)
    v7 = -l2Score;
  v8 = round(v7);
  v75 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  v73 = 2654435761 * self->_isRepliedTo;
  v74 = 2654435761 * self->_isFlagged;
  v71 = 2654435761 * self->_isSyntacticMatch;
  v72 = 2654435761 * self->_isSemanticMatch;
  semanticScore = self->_semanticScore;
  v10 = semanticScore;
  if (semanticScore < 0.0)
    v10 = -semanticScore;
  v11 = round(v10);
  v70 = (unint64_t)(fmod(v11, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v10 - v11, 0x40uLL);
  syntacticScore = self->_syntacticScore;
  v13 = syntacticScore;
  if (syntacticScore < 0.0)
    v13 = -syntacticScore;
  v14 = round(v13);
  v69 = (unint64_t)(fmod(v14, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v13 - v14, 0x40uLL);
  countBigramMatchInTextContent = self->_countBigramMatchInTextContent;
  countNgramMatchInTextContent = self->_countNgramMatchInTextContent;
  countUnigramPrefixMatchInTextContent = self->_countUnigramPrefixMatchInTextContent;
  countBigramPrefixMatchInTextContent = self->_countBigramPrefixMatchInTextContent;
  countNgramPrefixMatchInTextContent = self->_countNgramPrefixMatchInTextContent;
  countUnigramMatchInRecipients = self->_countUnigramMatchInRecipients;
  countBigramMatchInRecipients = self->_countBigramMatchInRecipients;
  countNgramMatchInRecipients = self->_countNgramMatchInRecipients;
  countUnigramPrefixMatchInRecipients = self->_countUnigramPrefixMatchInRecipients;
  countBigramPrefixMatchInRecipients = self->_countBigramPrefixMatchInRecipients;
  countNgramPrefixMatchInRecipients = self->_countNgramPrefixMatchInRecipients;
  countUnigramMatchInRecipientEmailAddresses = self->_countUnigramMatchInRecipientEmailAddresses;
  countBigramMatchInRecipientEmailAddresses = self->_countBigramMatchInRecipientEmailAddresses;
  countNgramMatchInRecipientEmailAddresses = self->_countNgramMatchInRecipientEmailAddresses;
  countUnigramPrefixMatchInRecipientEmailAddresses = self->_countUnigramPrefixMatchInRecipientEmailAddresses;
  countBigramPrefixMatchInRecipientEmailAddresses = self->_countBigramPrefixMatchInRecipientEmailAddresses;
  countNgramPrefixMatchInRecipientEmailAddresses = self->_countNgramPrefixMatchInRecipientEmailAddresses;
  countUnigramMatchInEmailAddresses = self->_countUnigramMatchInEmailAddresses;
  countBigramMatchInEmailAddresses = self->_countBigramMatchInEmailAddresses;
  countNgramMatchInEmailAddresses = self->_countNgramMatchInEmailAddresses;
  countUnigramPrefixMatchInEmailAddresses = self->_countUnigramPrefixMatchInEmailAddresses;
  countBigramPrefixMatchInEmailAddresses = self->_countBigramPrefixMatchInEmailAddresses;
  countNgramPrefixMatchInEmailAddresses = self->_countNgramPrefixMatchInEmailAddresses;
  countUnigramMatchInAttachmentTypes = self->_countUnigramMatchInAttachmentTypes;
  countBigramMatchInAttachmentTypes = self->_countBigramMatchInAttachmentTypes;
  countNgramMatchInAttachmentTypes = self->_countNgramMatchInAttachmentTypes;
  countUnigramPrefixMatchInAttachmentTypes = self->_countUnigramPrefixMatchInAttachmentTypes;
  countBigramPrefixMatchInAttachmentTypes = self->_countBigramPrefixMatchInAttachmentTypes;
  countNgramPrefixMatchInAttachmentTypes = self->_countNgramPrefixMatchInAttachmentTypes;
  countUnigramMatchInAttachmentNames = self->_countUnigramMatchInAttachmentNames;
  countBigramMatchInAttachmentNames = self->_countBigramMatchInAttachmentNames;
  countNgramMatchInAttachmentNames = self->_countNgramMatchInAttachmentNames;
  countUnigramPrefixMatchInAttachmentNames = self->_countUnigramPrefixMatchInAttachmentNames;
  v15 = 2654435761 * self->_countUnigramMatchInAuthors;
  v16 = 2654435761 * self->_countBigramMatchInAuthors;
  v35 = 2654435761 * self->_countNgramMatchInAuthors;
  v17 = 2654435761 * self->_countUnigramPrefixMatchInAuthors;
  v18 = 2654435761 * self->_countBigramPrefixMatchInAuthors;
  v34 = 2654435761 * self->_countNgramPrefixMatchInAuthors;
  v19 = 2654435761 * self->_countUnigramMatchInAuthorEmailAddresses;
  v20 = 2654435761 * self->_countBigramMatchInAuthorEmailAddresses;
  v21 = 2654435761 * self->_countNgramMatchInAuthorEmailAddresses;
  v22 = 2654435761 * self->_countUnigramPrefixMatchInAuthorEmailAddresses;
  v23 = 2654435761 * self->_countBigramPrefixMatchInAuthorEmailAddresses;
  v24 = 2654435761 * self->_countNgramPrefixMatchInAuthorEmailAddresses;
  v25 = 2654435761 * self->_countUnigramMatchInSubject;
  v26 = 2654435761 * self->_countBigramMatchInSubject;
  v27 = 2654435761 * self->_countNgramMatchInSubject;
  v28 = 2654435761 * self->_countUnigramPrefixMatchInSubject;
  v29 = 2654435761 * self->_countBigramPrefixMatchInSubject;
  v30 = 2654435761 * self->_countNgramPrefixMatchInSubject;
  v31 = 2654435761 * self->_countUnigramMatchInTextContent;
  v32 = v78 ^ v77 ^ v74 ^ v73 ^ v76 ^ v75 ^ v72 ^ v71 ^ v15 ^ v70 ^ v16 ^ v69 ^ v35 ^ v17 ^ v18 ^ v34 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ (2654435761 * countBigramMatchInTextContent) ^ (2654435761 * countNgramMatchInTextContent) ^ (2654435761 * countUnigramPrefixMatchInTextContent) ^ (2654435761 * countBigramPrefixMatchInTextContent) ^ (2654435761 * countNgramPrefixMatchInTextContent) ^ (2654435761 * countUnigramMatchInRecipients) ^ (2654435761 * countBigramMatchInRecipients) ^ (2654435761 * countNgramMatchInRecipients) ^ (2654435761 * countUnigramPrefixMatchInRecipients) ^ (2654435761 * countBigramPrefixMatchInRecipients) ^ (2654435761 * countNgramPrefixMatchInRecipients) ^ (2654435761 * countUnigramMatchInRecipientEmailAddresses) ^ (2654435761 * countBigramMatchInRecipientEmailAddresses) ^ (2654435761 * countNgramMatchInRecipientEmailAddresses) ^ (2654435761 * countUnigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countBigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countNgramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * countUnigramMatchInEmailAddresses) ^ (2654435761 * countBigramMatchInEmailAddresses) ^ (2654435761 * countNgramMatchInEmailAddresses) ^ (2654435761 * countUnigramPrefixMatchInEmailAddresses) ^ (2654435761 * countBigramPrefixMatchInEmailAddresses) ^ (2654435761 * countNgramPrefixMatchInEmailAddresses) ^ (2654435761 * countUnigramMatchInAttachmentTypes) ^ (2654435761 * countBigramMatchInAttachmentTypes) ^ (2654435761 * countNgramMatchInAttachmentTypes) ^ (2654435761 * countUnigramPrefixMatchInAttachmentTypes) ^ (2654435761 * countBigramPrefixMatchInAttachmentTypes) ^ (2654435761 * countNgramPrefixMatchInAttachmentTypes) ^ (2654435761 * countUnigramMatchInAttachmentNames) ^ (2654435761 * countBigramMatchInAttachmentNames) ^ (2654435761 * countNgramMatchInAttachmentNames) ^ (2654435761 * countUnigramPrefixMatchInAttachmentNames);
  return v32 ^ (2654435761 * self->_countBigramPrefixMatchInAttachmentNames) ^ (2654435761
                                                                                * self->_countNgramPrefixMatchInAttachmentNames);
}

- (BOOL)wasReorderedByRecency
{
  return self->_wasReorderedByRecency;
}

- (void)setWasReorderedByRecency:(BOOL)a3
{
  self->_wasReorderedByRecency = a3;
}

- (unint64_t)numEngagements
{
  return self->_numEngagements;
}

- (void)setNumEngagements:(unint64_t)a3
{
  self->_numEngagements = a3;
}

- (unint64_t)numDaysEngagedLast30Days
{
  return self->_numDaysEngagedLast30Days;
}

- (void)setNumDaysEngagedLast30Days:(unint64_t)a3
{
  self->_numDaysEngagedLast30Days = a3;
}

- (int)averageEngagementAgeLast7Days
{
  return self->_averageEngagementAgeLast7Days;
}

- (void)setAverageEngagementAgeLast7Days:(int)a3
{
  self->_averageEngagementAgeLast7Days = a3;
}

- (int)averageEngagementAgeLast14Days
{
  return self->_averageEngagementAgeLast14Days;
}

- (void)setAverageEngagementAgeLast14Days:(int)a3
{
  self->_averageEngagementAgeLast14Days = a3;
}

- (int)averageEngagementAgeLast21Days
{
  return self->_averageEngagementAgeLast21Days;
}

- (void)setAverageEngagementAgeLast21Days:(int)a3
{
  self->_averageEngagementAgeLast21Days = a3;
}

- (int)averageEngagementAgeLast30Days
{
  return self->_averageEngagementAgeLast30Days;
}

- (void)setAverageEngagementAgeLast30Days:(int)a3
{
  self->_averageEngagementAgeLast30Days = a3;
}

- (unint64_t)daysSinceReceipt
{
  return self->_daysSinceReceipt;
}

- (void)setDaysSinceReceipt:(unint64_t)a3
{
  self->_daysSinceReceipt = a3;
}

- (float)l1Score
{
  return self->_l1Score;
}

- (void)setL1Score:(float)a3
{
  self->_l1Score = a3;
}

- (float)l2Score
{
  return self->_l2Score;
}

- (void)setL2Score:(float)a3
{
  self->_l2Score = a3;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void)setIsFlagged:(BOOL)a3
{
  self->_isFlagged = a3;
}

- (BOOL)isRepliedTo
{
  return self->_isRepliedTo;
}

- (void)setIsRepliedTo:(BOOL)a3
{
  self->_isRepliedTo = a3;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (unsigned)countUnigramMatchInAuthors
{
  return self->_countUnigramMatchInAuthors;
}

- (void)setCountUnigramMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramMatchInAuthors = a3;
}

- (unsigned)countBigramMatchInAuthors
{
  return self->_countBigramMatchInAuthors;
}

- (void)setCountBigramMatchInAuthors:(unsigned int)a3
{
  self->_countBigramMatchInAuthors = a3;
}

- (unsigned)countNgramMatchInAuthors
{
  return self->_countNgramMatchInAuthors;
}

- (void)setCountNgramMatchInAuthors:(unsigned int)a3
{
  self->_countNgramMatchInAuthors = a3;
}

- (unsigned)countUnigramPrefixMatchInAuthors
{
  return self->_countUnigramPrefixMatchInAuthors;
}

- (void)setCountUnigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthors = a3;
}

- (unsigned)countBigramPrefixMatchInAuthors
{
  return self->_countBigramPrefixMatchInAuthors;
}

- (void)setCountBigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthors = a3;
}

- (unsigned)countNgramPrefixMatchInAuthors
{
  return self->_countNgramPrefixMatchInAuthors;
}

- (void)setCountNgramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthors = a3;
}

- (unsigned)countUnigramMatchInAuthorEmailAddresses
{
  return self->_countUnigramMatchInAuthorEmailAddresses;
}

- (void)setCountUnigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countBigramMatchInAuthorEmailAddresses
{
  return self->_countBigramMatchInAuthorEmailAddresses;
}

- (void)setCountBigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countNgramMatchInAuthorEmailAddresses
{
  return self->_countNgramMatchInAuthorEmailAddresses;
}

- (void)setCountNgramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countUnigramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countBigramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInAuthorEmailAddresses
{
  return self->_countNgramPrefixMatchInAuthorEmailAddresses;
}

- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthorEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInSubject
{
  return self->_countUnigramMatchInSubject;
}

- (void)setCountUnigramMatchInSubject:(unsigned int)a3
{
  self->_countUnigramMatchInSubject = a3;
}

- (unsigned)countBigramMatchInSubject
{
  return self->_countBigramMatchInSubject;
}

- (void)setCountBigramMatchInSubject:(unsigned int)a3
{
  self->_countBigramMatchInSubject = a3;
}

- (unsigned)countNgramMatchInSubject
{
  return self->_countNgramMatchInSubject;
}

- (void)setCountNgramMatchInSubject:(unsigned int)a3
{
  self->_countNgramMatchInSubject = a3;
}

- (unsigned)countUnigramPrefixMatchInSubject
{
  return self->_countUnigramPrefixMatchInSubject;
}

- (void)setCountUnigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInSubject = a3;
}

- (unsigned)countBigramPrefixMatchInSubject
{
  return self->_countBigramPrefixMatchInSubject;
}

- (void)setCountBigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countBigramPrefixMatchInSubject = a3;
}

- (unsigned)countNgramPrefixMatchInSubject
{
  return self->_countNgramPrefixMatchInSubject;
}

- (void)setCountNgramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countNgramPrefixMatchInSubject = a3;
}

- (unsigned)countUnigramMatchInTextContent
{
  return self->_countUnigramMatchInTextContent;
}

- (void)setCountUnigramMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramMatchInTextContent = a3;
}

- (unsigned)countBigramMatchInTextContent
{
  return self->_countBigramMatchInTextContent;
}

- (void)setCountBigramMatchInTextContent:(unsigned int)a3
{
  self->_countBigramMatchInTextContent = a3;
}

- (unsigned)countNgramMatchInTextContent
{
  return self->_countNgramMatchInTextContent;
}

- (void)setCountNgramMatchInTextContent:(unsigned int)a3
{
  self->_countNgramMatchInTextContent = a3;
}

- (unsigned)countUnigramPrefixMatchInTextContent
{
  return self->_countUnigramPrefixMatchInTextContent;
}

- (void)setCountUnigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInTextContent = a3;
}

- (unsigned)countBigramPrefixMatchInTextContent
{
  return self->_countBigramPrefixMatchInTextContent;
}

- (void)setCountBigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countBigramPrefixMatchInTextContent = a3;
}

- (unsigned)countNgramPrefixMatchInTextContent
{
  return self->_countNgramPrefixMatchInTextContent;
}

- (void)setCountNgramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countNgramPrefixMatchInTextContent = a3;
}

- (unsigned)countUnigramMatchInRecipients
{
  return self->_countUnigramMatchInRecipients;
}

- (void)setCountUnigramMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramMatchInRecipients = a3;
}

- (unsigned)countBigramMatchInRecipients
{
  return self->_countBigramMatchInRecipients;
}

- (void)setCountBigramMatchInRecipients:(unsigned int)a3
{
  self->_countBigramMatchInRecipients = a3;
}

- (unsigned)countNgramMatchInRecipients
{
  return self->_countNgramMatchInRecipients;
}

- (void)setCountNgramMatchInRecipients:(unsigned int)a3
{
  self->_countNgramMatchInRecipients = a3;
}

- (unsigned)countUnigramPrefixMatchInRecipients
{
  return self->_countUnigramPrefixMatchInRecipients;
}

- (void)setCountUnigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipients = a3;
}

- (unsigned)countBigramPrefixMatchInRecipients
{
  return self->_countBigramPrefixMatchInRecipients;
}

- (void)setCountBigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipients = a3;
}

- (unsigned)countNgramPrefixMatchInRecipients
{
  return self->_countNgramPrefixMatchInRecipients;
}

- (void)setCountNgramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipients = a3;
}

- (unsigned)countUnigramMatchInRecipientEmailAddresses
{
  return self->_countUnigramMatchInRecipientEmailAddresses;
}

- (void)setCountUnigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countBigramMatchInRecipientEmailAddresses
{
  return self->_countBigramMatchInRecipientEmailAddresses;
}

- (void)setCountBigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countNgramMatchInRecipientEmailAddresses
{
  return self->_countNgramMatchInRecipientEmailAddresses;
}

- (void)setCountNgramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countUnigramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countBigramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInRecipientEmailAddresses
{
  return self->_countNgramPrefixMatchInRecipientEmailAddresses;
}

- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipientEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInEmailAddresses
{
  return self->_countUnigramMatchInEmailAddresses;
}

- (void)setCountUnigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInEmailAddresses = a3;
}

- (unsigned)countBigramMatchInEmailAddresses
{
  return self->_countBigramMatchInEmailAddresses;
}

- (void)setCountBigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInEmailAddresses = a3;
}

- (unsigned)countNgramMatchInEmailAddresses
{
  return self->_countNgramMatchInEmailAddresses;
}

- (void)setCountNgramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInEmailAddresses = a3;
}

- (unsigned)countUnigramPrefixMatchInEmailAddresses
{
  return self->_countUnigramPrefixMatchInEmailAddresses;
}

- (void)setCountUnigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countBigramPrefixMatchInEmailAddresses
{
  return self->_countBigramPrefixMatchInEmailAddresses;
}

- (void)setCountBigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countNgramPrefixMatchInEmailAddresses
{
  return self->_countNgramPrefixMatchInEmailAddresses;
}

- (void)setCountNgramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInEmailAddresses = a3;
}

- (unsigned)countUnigramMatchInAttachmentTypes
{
  return self->_countUnigramMatchInAttachmentTypes;
}

- (void)setCountUnigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentTypes = a3;
}

- (unsigned)countBigramMatchInAttachmentTypes
{
  return self->_countBigramMatchInAttachmentTypes;
}

- (void)setCountBigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentTypes = a3;
}

- (unsigned)countNgramMatchInAttachmentTypes
{
  return self->_countNgramMatchInAttachmentTypes;
}

- (void)setCountNgramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentTypes = a3;
}

- (unsigned)countUnigramPrefixMatchInAttachmentTypes
{
  return self->_countUnigramPrefixMatchInAttachmentTypes;
}

- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countBigramPrefixMatchInAttachmentTypes
{
  return self->_countBigramPrefixMatchInAttachmentTypes;
}

- (void)setCountBigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countNgramPrefixMatchInAttachmentTypes
{
  return self->_countNgramPrefixMatchInAttachmentTypes;
}

- (void)setCountNgramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentTypes = a3;
}

- (unsigned)countUnigramMatchInAttachmentNames
{
  return self->_countUnigramMatchInAttachmentNames;
}

- (void)setCountUnigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentNames = a3;
}

- (unsigned)countBigramMatchInAttachmentNames
{
  return self->_countBigramMatchInAttachmentNames;
}

- (void)setCountBigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentNames = a3;
}

- (unsigned)countNgramMatchInAttachmentNames
{
  return self->_countNgramMatchInAttachmentNames;
}

- (void)setCountNgramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentNames = a3;
}

- (unsigned)countUnigramPrefixMatchInAttachmentNames
{
  return self->_countUnigramPrefixMatchInAttachmentNames;
}

- (void)setCountUnigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentNames = a3;
}

- (unsigned)countBigramPrefixMatchInAttachmentNames
{
  return self->_countBigramPrefixMatchInAttachmentNames;
}

- (void)setCountBigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentNames = a3;
}

- (unsigned)countNgramPrefixMatchInAttachmentNames
{
  return self->_countNgramPrefixMatchInAttachmentNames;
}

- (void)setCountNgramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentNames = a3;
}

- (_CPMailRankingSignalsForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPMailRankingSignalsForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _CPMailRankingSignalsForFeedback *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPMailRankingSignalsForFeedback;
  v5 = -[_CPMailRankingSignalsForFeedback init](&v24, sel_init);
  if (v5)
  {
    -[_CPMailRankingSignalsForFeedback setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", objc_msgSend(v4, "wasReorderedByRecency"));
    -[_CPMailRankingSignalsForFeedback setNumEngagements:](v5, "setNumEngagements:", objc_msgSend(v4, "numEngagements"));
    -[_CPMailRankingSignalsForFeedback setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", objc_msgSend(v4, "numDaysEngagedLast30Days"));
    objc_msgSend(v4, "averageEngagementAgeLast7Days");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "averageEngagementAgeLast7Days");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast7Days:](v5, "setAverageEngagementAgeLast7Days:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast14Days");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "averageEngagementAgeLast14Days");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast14Days:](v5, "setAverageEngagementAgeLast14Days:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast21Days");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "averageEngagementAgeLast21Days");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast21Days:](v5, "setAverageEngagementAgeLast21Days:", objc_msgSend(v11, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast30Days");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "averageEngagementAgeLast30Days");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMailRankingSignalsForFeedback setAverageEngagementAgeLast30Days:](v5, "setAverageEngagementAgeLast30Days:", objc_msgSend(v13, "intValue"));

    }
    -[_CPMailRankingSignalsForFeedback setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", objc_msgSend(v4, "daysSinceReceipt"));
    objc_msgSend(v4, "l1Score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "l1Score");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[_CPMailRankingSignalsForFeedback setL1Score:](v5, "setL1Score:");

    }
    objc_msgSend(v4, "l2Score");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "l2Score");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      -[_CPMailRankingSignalsForFeedback setL2Score:](v5, "setL2Score:");

    }
    -[_CPMailRankingSignalsForFeedback setIsFlagged:](v5, "setIsFlagged:", objc_msgSend(v4, "isFlagged"));
    -[_CPMailRankingSignalsForFeedback setIsRepliedTo:](v5, "setIsRepliedTo:", objc_msgSend(v4, "isRepliedTo"));
    -[_CPMailRankingSignalsForFeedback setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    -[_CPMailRankingSignalsForFeedback setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "semanticScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "semanticScore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[_CPMailRankingSignalsForFeedback setSemanticScore:](v5, "setSemanticScore:");

    }
    objc_msgSend(v4, "syntacticScore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "syntacticScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      -[_CPMailRankingSignalsForFeedback setSyntacticScore:](v5, "setSyntacticScore:");

    }
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", objc_msgSend(v4, "countUnigramMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", objc_msgSend(v4, "countBigramMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", objc_msgSend(v4, "countNgramMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", objc_msgSend(v4, "countBigramPrefixMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", objc_msgSend(v4, "countNgramPrefixMatchInAuthors"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", objc_msgSend(v4, "countUnigramMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", objc_msgSend(v4, "countBigramMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", objc_msgSend(v4, "countNgramMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", objc_msgSend(v4, "countUnigramPrefixMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", objc_msgSend(v4, "countBigramPrefixMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", objc_msgSend(v4, "countNgramPrefixMatchInSubject"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", objc_msgSend(v4, "countUnigramMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", objc_msgSend(v4, "countBigramMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", objc_msgSend(v4, "countNgramMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", objc_msgSend(v4, "countBigramPrefixMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", objc_msgSend(v4, "countNgramPrefixMatchInTextContent"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", objc_msgSend(v4, "countUnigramMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", objc_msgSend(v4, "countBigramMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", objc_msgSend(v4, "countNgramMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", objc_msgSend(v4, "countBigramPrefixMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", objc_msgSend(v4, "countNgramPrefixMatchInRecipients"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", objc_msgSend(v4, "countBigramMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", objc_msgSend(v4, "countNgramMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramMatchInAttachmentNames"));
    -[_CPMailRankingSignalsForFeedback setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", objc_msgSend(v4, "countBigramMatchInAttachmentNames"));
    -[_CPMailRankingSignalsForFeedback setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", objc_msgSend(v4, "countNgramMatchInAttachmentNames"));
    -[_CPMailRankingSignalsForFeedback setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"));
    -[_CPMailRankingSignalsForFeedback setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentNames"));
    -[_CPMailRankingSignalsForFeedback setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames"));
    v22 = v5;
  }

  return v5;
}

@end
