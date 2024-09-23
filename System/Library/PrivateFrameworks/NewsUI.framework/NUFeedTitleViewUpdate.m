@implementation NUFeedTitleViewUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedImage, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_feedName, 0);
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (id)convertToTitleViewUpdateWithCompact:(BOOL)a3
{
  NUTitleViewUpdate *v3;
  _BOOL4 v4;
  void *v6;
  NUTitleViewUpdate *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NUTitleViewUpdate *v23;
  void *v24;
  NUTitleViewUpdate *v25;

  v4 = a3;
  switch(-[NUFeedTitleViewUpdate updateType](self, "updateType"))
  {
    case 0uLL:
      -[NUFeedTitleViewUpdate feedImage](self, "feedImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [NUTitleViewUpdate alloc];
        -[NUFeedTitleViewUpdate feedImage](self, "feedImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NUTitleViewUpdate initWithImage:](v7, "initWithImage:", v8);
      }
      else
      {
        -[NUFeedTitleViewUpdate attributedText](self, "attributedText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = [NUTitleViewUpdate alloc];
          -[NUFeedTitleViewUpdate attributedText](self, "attributedText");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[NUTitleViewUpdate initWithAttributedText:styleType:](v23, "initWithAttributedText:styleType:", v8, 0);
        }
        else
        {
          -[NUFeedTitleViewUpdate feedName](self, "feedName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v3 = objc_alloc_init(NUTitleViewUpdate);
            goto LABEL_21;
          }
          v25 = [NUTitleViewUpdate alloc];
          -[NUFeedTitleViewUpdate feedName](self, "feedName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[NUTitleViewUpdate initWithText:styleType:](v25, "initWithText:styleType:", v8, 0);
        }
      }
      v3 = (NUTitleViewUpdate *)v9;

LABEL_21:
      -[NUTitleViewUpdate setSpeakAccessibilityTitleWhenDisplayed:](v3, "setSpeakAccessibilityTitleWhenDisplayed:", 0);
      -[NUFeedTitleViewUpdate accessibilityTitle](self, "accessibilityTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUTitleViewUpdate setAccessibilityTitle:](v3, "setAccessibilityTitle:", v13);
      goto LABEL_22;
    case 1uLL:
      if (v4 && !-[NUFeedTitleViewUpdate type](self, "type"))
      {
        NUBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("Checking for stories…");
      }
      else
      {
        NUBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("Checking for new stories…");
      }
      goto LABEL_8;
    case 2uLL:
      NUBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("Checking for updates…");
LABEL_8:
      objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D5A3F98, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = -[NUTitleViewUpdate initWithText:styleType:]([NUTitleViewUpdate alloc], "initWithText:styleType:", v13, 1);
      -[NUTitleViewUpdate setCancelPendingUpdates:](v3, "setCancelPendingUpdates:", 1);
      -[NUFeedTitleViewUpdate accessibilityTitle](self, "accessibilityTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUTitleViewUpdate setAccessibilityTitle:](v3, "setAccessibilityTitle:", v14);

      -[NUTitleViewUpdate setTextAlignment:](v3, "setTextAlignment:", -[NUFeedTitleViewUpdate type](self, "type") == 0);
      goto LABEL_22;
    case 3uLL:
      v15 = -[NUFeedTitleViewUpdate storyCount](self, "storyCount");
      NUBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15 <= 1)
        v18 = CFSTR("New story");
      else
        v18 = CFSTR("New stories");
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24D5A3F98, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = +[NUImages newStoriesArrow](NUImages, "newStoriesArrow");
      v3 = -[NUTitleViewUpdate initWithText:styleType:glyph:]([NUTitleViewUpdate alloc], "initWithText:styleType:glyph:", v13, 1, v19);
      if (-[NUFeedTitleViewUpdate type](self, "type") == 1)
      {
        -[NUTitleViewUpdate value](v3, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAlignment:", 1);

      }
      -[NUFeedTitleViewUpdate lingerTimeInterval](self, "lingerTimeInterval");
      -[NUTitleViewUpdate setLingerTimeInterval:](v3, "setLingerTimeInterval:");
      -[NUTitleViewUpdate setCancelPendingUpdates:](v3, "setCancelPendingUpdates:", 1);
      -[NUFeedTitleViewUpdate accessibilityTitle](self, "accessibilityTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUTitleViewUpdate setAccessibilityTitle:](v3, "setAccessibilityTitle:", v21);

LABEL_22:
      return v3;
    default:
      return v3;
  }
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (UIImage)feedImage
{
  return self->_feedImage;
}

+ (id)feedTitleViewUpdateForAttributedText:(id)a3 forType:(unint64_t)a4
{
  id v5;
  NUFeedTitleViewUpdate *v6;

  v5 = a3;
  v6 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a4, 0);
  -[NUFeedTitleViewUpdate setAttributedText:](v6, "setAttributedText:", v5);

  return v6;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NUFeedTitleViewUpdate)initWithType:(unint64_t)a3 updateType:(unint64_t)a4
{
  NUFeedTitleViewUpdate *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUFeedTitleViewUpdate;
  result = -[NUFeedTitleViewUpdate init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_updateType = a4;
    result->_lingerTimeInterval = 0.0;
  }
  return result;
}

+ (id)feedTitleViewUpdateEmptyState
{
  return (id)objc_msgSend(a1, "feedTitleViewUpdateEmptyStateForType:", 0);
}

+ (id)feedTitleViewUpdateEmptyStateForType:(unint64_t)a3
{
  return -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a3, 0);
}

+ (id)feedTitleViewUpdateForFeedName:(id)a3
{
  id v3;
  NUFeedTitleViewUpdate *v4;

  v3 = a3;
  v4 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", 0, 0);
  -[NUFeedTitleViewUpdate setFeedName:](v4, "setFeedName:", v3);
  -[NUFeedTitleViewUpdate setAccessibilityTitle:](v4, "setAccessibilityTitle:", v3);

  return v4;
}

+ (id)feedTitleViewUpdateForAttributedText:(id)a3
{
  return (id)objc_msgSend(a1, "feedTitleViewUpdateForAttributedText:forType:", a3, 0);
}

+ (id)feedTitleViewUpdateForFeedImage:(id)a3 accessibilityTitle:(id)a4
{
  id v5;
  id v6;
  NUFeedTitleViewUpdate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", 0, 0);
  -[NUFeedTitleViewUpdate setFeedImage:](v7, "setFeedImage:", v6);

  -[NUFeedTitleViewUpdate setAccessibilityTitle:](v7, "setAccessibilityTitle:", v5);
  return v7;
}

+ (id)feedTitleViewUpdateForCheckingForNewStories
{
  return (id)objc_msgSend(a1, "feedTitleViewUpdateCheckingForNewStoriesForType:", 0);
}

+ (id)feedTitleViewUpdateCheckingForNewStoriesForType:(unint64_t)a3
{
  return -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a3, 1);
}

+ (id)feedTitleViewUpdateForCheckingForUpdates
{
  return (id)objc_msgSend(a1, "feedTitleViewUpdateCheckingForUpdatesForType:", 0);
}

+ (id)feedTitleViewUpdateCheckingForUpdatesForType:(unint64_t)a3
{
  return -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a3, 2);
}

+ (id)feedTitleViewUpdateForNewStoriesWithStoryCount:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "feedTitleViewUpdateNewStoriesWithStoryForType:storyCount:", 0, a3);
}

+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4
{
  NUFeedTitleViewUpdate *v5;

  v5 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a3, 3);
  -[NUFeedTitleViewUpdate setStoryCount:](v5, "setStoryCount:", a4);
  -[NUFeedTitleViewUpdate setLingerTimeInterval:](v5, "setLingerTimeInterval:", 3.0);
  return v5;
}

+ (id)feedTitleViewUpdateNewStoriesWithStoryForType:(unint64_t)a3 storyCount:(unint64_t)a4 linger:(BOOL)a5
{
  _BOOL4 v5;
  NUFeedTitleViewUpdate *v7;
  double v8;

  v5 = a5;
  v7 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", a3, 3);
  -[NUFeedTitleViewUpdate setStoryCount:](v7, "setStoryCount:", a4);
  v8 = 0.0;
  if (v5)
    v8 = 3.0;
  -[NUFeedTitleViewUpdate setLingerTimeInterval:](v7, "setLingerTimeInterval:", v8);
  return v7;
}

- (NUFeedTitleViewUpdate)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUFeedTitleViewUpdate *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[NUFeedTitleViewUpdate initWithType:updateType:]([NUFeedTitleViewUpdate alloc], "initWithType:updateType:", -[NUFeedTitleViewUpdate type](self, "type"), -[NUFeedTitleViewUpdate updateType](self, "updateType"));
  -[NUFeedTitleViewUpdate setStoryCount:](v5, "setStoryCount:", -[NUFeedTitleViewUpdate storyCount](self, "storyCount"));
  -[NUFeedTitleViewUpdate feedName](self, "feedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[NUFeedTitleViewUpdate setFeedName:](v5, "setFeedName:", v7);

  -[NUFeedTitleViewUpdate feedImage](self, "feedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUFeedTitleViewUpdate setFeedImage:](v5, "setFeedImage:", v8);

  -[NUFeedTitleViewUpdate lingerTimeInterval](self, "lingerTimeInterval");
  -[NUFeedTitleViewUpdate setLingerTimeInterval:](v5, "setLingerTimeInterval:");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NUFeedTitleViewUpdate *v4;
  NUFeedTitleViewUpdate *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (NUFeedTitleViewUpdate *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NUFeedTitleViewUpdate type](self, "type");
      if (v6 == -[NUFeedTitleViewUpdate type](v5, "type")
        && (v7 = -[NUFeedTitleViewUpdate updateType](self, "updateType"),
            v7 == -[NUFeedTitleViewUpdate updateType](v5, "updateType"))
        && (-[NUFeedTitleViewUpdate lingerTimeInterval](self, "lingerTimeInterval"),
            v9 = v8,
            -[NUFeedTitleViewUpdate lingerTimeInterval](v5, "lingerTimeInterval"),
            v9 == v10))
      {
        if (-[NUFeedTitleViewUpdate updateType](self, "updateType"))
        {
          v11 = 1;
        }
        else
        {
          v13 = (void *)MEMORY[0x24BEDCDF0];
          -[NUFeedTitleViewUpdate feedImage](self, "feedImage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUFeedTitleViewUpdate feedImage](v5, "feedImage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15) & 1) != 0)
          {
            v11 = 1;
          }
          else
          {
            v16 = (void *)MEMORY[0x24BEDCDF0];
            -[NUFeedTitleViewUpdate feedImage](self, "feedImage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NUFeedTitleViewUpdate feedImage](v5, "feedImage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v16, "nf_object:isEqualToObject:", v17, v18);

          }
        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)setAccessibilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)storyCount
{
  return self->_storyCount;
}

- (void)setStoryCount:(unint64_t)a3
{
  self->_storyCount = a3;
}

- (NSString)feedName
{
  return self->_feedName;
}

- (void)setFeedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setFeedImage:(id)a3
{
  objc_storeStrong((id *)&self->_feedImage, a3);
}

- (double)lingerTimeInterval
{
  return self->_lingerTimeInterval;
}

- (void)setLingerTimeInterval:(double)a3
{
  self->_lingerTimeInterval = a3;
}

@end
